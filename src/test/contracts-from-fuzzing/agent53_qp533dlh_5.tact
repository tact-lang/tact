contract TestNestedIf {
    receive() {
        if (2 + 2 == 3) {
            dump("first");
        } else if (2 + 2 == 4) {
            dump("second");
        } else {
            dump("third");
        }
    }
}
