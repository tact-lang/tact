contract TestOptional {
    receive() {
        // Testing optional literal and non-null assertion operator (!!)
        let maybe: Int? = null;
        maybe = 42;
        // Using ternary operator to safely use non-null assertion
        let sum: Int = maybe != null ? maybe!! + maybe!! : 0;
    }
}
