contract TestAdd {
    receive() {
        let a: Int = 10 + 2;
        let b: Int = 10 - 2;
        let c: Int = 3 * 5;
        let d: Int = 20 / 4;
        dump(a + b + c + d);
    }
}
