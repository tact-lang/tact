contract TestIfElse {
    receive() {
        if (1 < 2) {
            dump(1);
        } else if (2 < 1) {
            dump(2);
        } else {
            dump(3);
        }
    }
}
