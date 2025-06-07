contract TestIfValid {
    receive() {
        if (2 + 2 == 4) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
