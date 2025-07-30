contract Test {
    receive() {
        let a: Int = 10;
        let b: Int = 20;
        let sum: Int = a + b;
        dump(sum);
    }
}
