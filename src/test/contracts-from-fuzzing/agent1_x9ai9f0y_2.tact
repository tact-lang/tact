contract TestIfCorrect {
    receive() {
        if (2 + 2 == 4) {
            dump("correct");
        }
    }
}
