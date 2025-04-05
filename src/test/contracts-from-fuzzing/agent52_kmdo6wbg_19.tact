contract NonNullAssertFailure {
    receive() {
        let x: Int? = null;
        dump(x!!);
    }
}
