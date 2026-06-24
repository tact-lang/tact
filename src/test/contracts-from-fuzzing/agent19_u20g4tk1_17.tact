contract TestFromBase64 {
    receive() {
        // Test fromBase64 function on a valid Base64 string
        let s: String = "SGVyZSdzIEpvaG5ueSE="; // "Here's Johnny!"
        let slice1: Slice = s.fromBase64();
        let slice2: Slice = s.asSlice().fromBase64();
        if (!(slice1 == slice2)) {
            require(false, "Base64 conversion mismatch");
        }
    }
}
