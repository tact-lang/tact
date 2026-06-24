contract TestLogicalAnd {
    receive() {
        dump(true && false);
    }
}
