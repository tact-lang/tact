contract Test {
    receive() {
        if (2 + 2 == 3) {
            dump("3?");
        } else if (2 + 2 == 4) {
            dump(4);
        } else {
            dump(0);
        }
    }
}
