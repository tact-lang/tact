contract Test {
    receive() {
        if (2 + 2 == 4) {
            dump(true);
        } else {
            dump(false);
        }
    }
}