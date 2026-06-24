contract OptionalExprTest {
    fun test(): Int {
        let opt: Int? = null;
        opt = 255;
        // Using non-null assertion operator to extract the value
        return opt!!; // Expected to return 255
    }

    receive() {
        self.test();
    }
}
