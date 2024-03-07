import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'forget_password.dart' show ForgotPassword;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPassword> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode1;
  TextEditingController? emailFieldController1;
  String? Function(BuildContext, String?)? emailFieldController1Validator;
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode2;
  TextEditingController? emailFieldController2;
  String? Function(BuildContext, String?)? emailFieldController2Validator;
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode3;
  TextEditingController? emailFieldController3;
  String? Function(BuildContext, String?)? emailFieldController3Validator;
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode4;
  TextEditingController? emailFieldController4;
  String? Function(BuildContext, String?)? emailFieldController4Validator;
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode5;
  TextEditingController? emailFieldController5;
  String? Function(BuildContext, String?)? emailFieldController5Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    emailFieldFocusNode1?.dispose();
    emailFieldController1?.dispose();

    emailFieldFocusNode2?.dispose();
    emailFieldController2?.dispose();

    emailFieldFocusNode3?.dispose();
    emailFieldController3?.dispose();

    emailFieldFocusNode4?.dispose();
    emailFieldController4?.dispose();

    emailFieldFocusNode5?.dispose();
    emailFieldController5?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
