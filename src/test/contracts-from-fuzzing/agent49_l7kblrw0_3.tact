contract TestOptional() {
    fun run() {
        // Declare an optional integer initialized to null
        let opt: Int? = null;
        // Check that it is null
        if (opt == null) {
            dump(0);
        }
        // Assign a value
        opt = 123;
        // Non-null assertion: should succeed now
        dump(opt!!);
    }

    receive() {
        self.run();
    }
}
