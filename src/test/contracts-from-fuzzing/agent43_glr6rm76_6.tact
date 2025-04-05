contract TestIfElseNested {
    receive() {
        if (2 + 2 == 3) {
            dump(0);
        } else if (2 + 2 == 4) {
            dump(1);
        } else {
            dump(2);
        }
    }
}
