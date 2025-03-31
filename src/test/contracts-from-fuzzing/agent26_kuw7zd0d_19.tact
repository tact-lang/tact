contract TestOptionalStringCorrected {
    receive() {
        // Testing usage of an optional string
        let opt: String? = null;
        if (opt != null) {
            // When opt is not null, convert to Slice using non-null assertion
            let s: Slice = opt!!.asSlice();
        } else {
            // Fallback string
            let s: String = "Default string";
        }
    }
}
