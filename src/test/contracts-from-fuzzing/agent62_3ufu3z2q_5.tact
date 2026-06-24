contract Test {
    receive() {
        // Test: empty string literal
        let empty: String = "";
        if (empty != "") {
            throw(1);
        }

        // Test: round-trip conversion using asSlice and asString
        let original: String = "Tact Fuzz Testing";
        let roundTrip: String = original.asSlice().asString();
        if (original != roundTrip) {
            throw(2);
        }

        // Test: comparison of two identical string literals
        let a: String = "Identical";
        let b: String = "Identical";
        if (a != b) {
            throw(3);
        }
    }
}
