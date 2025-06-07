contract TestOptionalOk {
    fun test() {
        // Declare an optional Int initialized to null
        let opt: Int? = null;
        // Assign a value
        opt = 255;
        // Use non-null assertion to get the value
        dump(opt!!); // expects to dump 255
    }
    receive() { self.test(); }
}
