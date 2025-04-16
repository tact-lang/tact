contract TestOptionals() {
    fun test() {
        // Test valid initialization and assignment of an optional Int
        let op: Int? = null;
        // assign a non-null value
        op = 100;
        // use non-null assertion operator !! to get the value
        dump(op!!); // should output 100
        // explicit check for null
        if (op != null) {
            dump(op);
        } else {
            dump(0);
        }
    }
    receive() {
        self.test();
    }
}
