contract OptionalExprTest {
    fun test() {
        // Testing Optionals: non-null assertion operator (!!) on a non-null value
        let opt: Int? = 10;
        dump(opt!!); // Expected to print 10
    }
    
    receive() {
        self.test();
    }
}