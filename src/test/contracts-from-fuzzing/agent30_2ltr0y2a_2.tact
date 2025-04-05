contract Test {
    receive() {
        // Correct let declaration with explicit type and initializer
        let x: Int = 10;
        dump(x);
    }
}
