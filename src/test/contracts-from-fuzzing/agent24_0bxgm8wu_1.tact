contract TestLetCorrect {
    receive() {
        // Correct let statement: requires initializer
        let x: Int = 5;
        dump(x);
    }
}
