contract TestIfCorrect {
    receive() {
        if (true) {
            let x: Int = 1;
        } else {
            let x: Int = 2;
        }
    }
}
