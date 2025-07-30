contract TestEscapeNewline {
    receive() {
        let s: String = "line \n another line";
    }
}
