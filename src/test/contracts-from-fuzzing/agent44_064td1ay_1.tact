contract TestIf {
    receive() {
        if (true) {
            dump("true branch");
        } else {
            dump("false branch");
        }
    }
}
