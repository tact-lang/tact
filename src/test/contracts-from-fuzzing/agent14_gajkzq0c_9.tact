contract Test {
    fun testOptionalComparison() {
        let maybe: Int? = null;
        if (maybe == null) {
            // Do something
        }
    }

    receive() {
        self.testOptionalComparison();
    }
}