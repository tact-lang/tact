contract Test {
    receive() {
        // Augmented assignment test
        let x: Int = 1;
        x += 2;
        dump(x);
    }
}
