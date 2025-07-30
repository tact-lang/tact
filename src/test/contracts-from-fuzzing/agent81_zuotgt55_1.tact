contract TestIf {
    receive() {
        if (1 == 1) {
            dump("if_true");
        } else {
            dump("if_false");
        }
    }
}
