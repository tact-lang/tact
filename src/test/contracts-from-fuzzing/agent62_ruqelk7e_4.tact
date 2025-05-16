contract TestIfValid {
    receive() {
        if (true) {
            dump(42);
        } else {
            dump(0);
        }
    }
}
