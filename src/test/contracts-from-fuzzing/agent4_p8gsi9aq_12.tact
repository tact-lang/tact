contract TestOptionals {
    receive() {
        // Test non-null assertion on an optional Int and String
        let optInt: Int? = 42;
        let x: Int = optInt!!; // expected to be 42

        let optStr: String? = "Tact";
        let s: String = optStr!!; // expected to be "Tact"

        // Uncommenting the following would cause a runtime error, but it should compile:
        // let noneVal: Int? = null;
        // let errorInt: Int = noneVal!!;
    }
}
