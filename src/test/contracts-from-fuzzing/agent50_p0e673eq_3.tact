contract TestOptionalValid {
    fun test() {
        // Valid usage of optionals
        let opt: Int? = null;
        let num: Int? = 42;
        // Using non-null assertion on an optional that holds a value
        dump(num!!); // expected output: 42
        // Conditional check on an optional that is null
        if (opt != null) {
            dump(opt!!);
        } else {
            dump(0);
        }
    }
    receive() { self.test(); }
}
