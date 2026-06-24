contract TestReturnFormatting {
    // This function tests the handling of line breaks after the 'return' keyword.
    fun formatTest(): Int {
        // The following 'return' is followed by a newline before the expression.
        // If Tact treats the newline as the end of the 'return' statement, it will try to return 'void', causing a type mismatch error.
        return
        100;
    }

    // For comparison, a correctly formatted return statement:
    fun correctFormat(): Int {
        return 200;
    }
}
