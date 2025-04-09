contract TestNestedIf {
    receive() {
        if (2 + 2 == 3) {
            dump(1);
        } else if (2 + 2 == 4) {
            dump(2);
        } else {
            dump(3);
        }
    }
}
