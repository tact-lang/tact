contract TestIfCorrect {
    receive() {
        if (true) {
            dump(42);
        }
    }
}
