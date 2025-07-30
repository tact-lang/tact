contract Test {
    fun test_primitive() {
        let a: Int = 10;
        let b: Bool = true;
        let s: String = "hello";
        // Expected output: dump 15
        dump(a + 5);
    }
}
