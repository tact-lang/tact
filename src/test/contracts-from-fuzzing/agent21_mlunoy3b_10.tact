contract TestOptional {
    receive() {
        // Testing optional-related expressions and non-null assertion
        let maybeInt: Int? = 42;
        let unwrapped: Int = maybeInt!!; // non-null assertion; valid since maybeInt is not null

        let maybeStr: String? = null;
        // Using ternary operator to test an optional check
        let desc: String = (maybeStr != null) ? "Exists" : "Missing"; 

        return;
    }
}
