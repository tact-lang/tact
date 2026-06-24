contract TestMultiline {
    receive() {
        // Testing multi-line string literal (which is not officially supported if not escaped)
        "This is a line
Next line";
    }
}
