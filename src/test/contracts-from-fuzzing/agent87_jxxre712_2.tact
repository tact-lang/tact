contract TestEscapeSequence {
    receive() {
        let escaped: String = "Line1\nLine2\tTabbed";
        emit(escaped.asComment());
    }
}