contract TestStringFromBase64 {
    receive() {
        // Test conversion of a Base64 string to a Slice and then back to a String.
        // "SGVsbG8=" is the Base64 encoding for "Hello".
        let s: String = "SGVsbG8=";
        let slice1: Slice = s.fromBase64();
        let s2: String = slice1.asString();
        if (s2 == "Hello") {
            let dummy: Int = 1;
        } else {
            let dummy: Int = 0;
        }
    }
}
