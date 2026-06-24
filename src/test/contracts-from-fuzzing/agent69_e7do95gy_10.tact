contract TestStringEquality {
    receive() {
        // Test 9: String equality comparison
        let a: String = "testing";
        let b: String = "testing";
        if (a == b) {
            // Strings are equal
            let _dummy: Int = 1;
        } else {
            let _dummy: Int = 0;
        }
    }
}
