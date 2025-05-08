contract TestWhile {
    receive() {
        while (false) {
            // empty loop body
        }
        return;
    }
}
