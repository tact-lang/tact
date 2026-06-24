contract TestNestedIf {
    receive() {
        if (false) {
            dump("if false");
        } else if (true) {
            dump("else if true");
        } else {
            dump("else false");
        }
    }
}
