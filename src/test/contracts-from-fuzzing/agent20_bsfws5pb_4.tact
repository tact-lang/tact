contract Test {
    receive() {
        // Testing division rounding as per docs: 6 / 5 should yield 1
        let a: Int = 6 / 5;
        dump(a);
    }
}
