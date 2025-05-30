contract TestInt() {
    receive() {
        let a: Int = 42;
        let b: Int = 1_000;
        dump(a + b); // Expect to dump 1042
    }
}
