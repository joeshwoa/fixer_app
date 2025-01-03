import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fixer_app/cubit/cubit.dart';
import 'package:fixer_app/cubit/states.dart';
import 'package:fixer_app/generated/assets.dart';
import 'package:fixer_app/shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import 'services_page_model.dart';
export 'services_page_model.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage>
    with TickerProviderStateMixin {
  late ServicesPageModel _model;
  
  bool loadingInProgress = false;
  bool loadingComplete = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 50),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 70),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 80),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 90),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 90),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServicesPageModel());
    AppCubit.get(context).getCarServicesByNumber(carNumber: AppCubit.get(context).loginByCodeModel!.carData!.carNumber!);
    setupAnimations(
      animationsMap.values.where((anim) =>
      anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return BlocConsumer<AppCubit,AppCubitStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: AutoSizeText(
                'My Service'.tr(),
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0,
            ),
            body:ConditionalBuilder(
                condition: state is AppGetCarServicesByNumberLoadingState,
                builder:(context) =>  const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitDualRing(
                      color: Color(0xFFF68B1E),
                      size: 50,
                    ),
                  ),
                ),
                fallback: (context) =>  Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 16),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      AppCubit.get(context).getCarServicesByNumber(carNumber: AppCubit.get(context).loginByCodeModel!.carData!.carNumber!);
                    },
                    child: ListView(
                      children: [
                        if(AppCubit.get(context).getServicesModel!.visits.isEmpty)Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Image(image: AssetImage(Assets.imagesNoServices),),
                        ),
                        if(AppCubit.get(context).getServicesModel!.visits.isEmpty)AutoSizeText(
                          'No Services Found'.tr(),
                          style: TextStyle(
                              color: Color(0xFFF68B1E),
                              fontSize: 50,
                              fontWeight: FontWeight.bold,

                              shadows: [
                                Shadow(color: Colors.black12, blurRadius: 10, offset: Offset(10,10))
                              ]
                          ),
                          textAlign: TextAlign.center,
                        ),
                        if(AppCubit.get(context).getServicesModel!.visits.isNotEmpty) for(int index = 0; index < AppCubit.get(context).getServicesModel!.visits.length; index++)...[
                          serviceItemBuilder(AppCubit.get(context).getServicesModel!.visits[index],AppCubit.get(context))
                        ]
                      ],
                    ),
                  ),
                ),
            )
          ),
        );
      },
    );
  }
}
