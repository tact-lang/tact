contract Test {
    receive() {
        if (myCode() != codeOf Test) {
            throw(1);
        }
    }
}
