contract TestOptionals {
    fun test() {
        // Declare an optional integer with initial null
        let optInt: Int? = null;
        // Reassign with a valid value
        optInt = 255;
        // Use non-null assertion to extract value
        let value: Int = optInt!!;
        // Dump the value (for testing, assume dump prints to logs)
        dump(value);
        
        // Declare an optional boolean, defaulting to null
        let optBool: Bool? = null;
        // Reassign with a boolean value
        optBool = true;
        if (optBool != null) {
            dump(optBool!!);
        }
    }

    // Receiver to invoke test
    receive() { self.test(); }
}
