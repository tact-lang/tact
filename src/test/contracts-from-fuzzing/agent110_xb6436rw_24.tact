contract TestExternalWrong {
    // Attempting to declare an external receiver with a parameter type is invalid: external receivers must have a literal string comment.
    external(msg: String) {
         // This should fail compilation.
    }
}
