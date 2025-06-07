contract ExprOptionalTest {
    fun test() {
        let maybe: Int? = 5;
        // Non-null assertion operator to extract the non-null value
        dump(maybe!!); // expected to dump 5
    }

    receive() {
        self.test();
    }
}
