contract TestFromBase64Invalid {
    receive() {
        // This test checks that .fromBase64() throws when the string contains invalid Base64 characters.
        // The string "Invalid*Base64" contains an asterisk (*) which is not in the Base64 set.
        // According to documentation, this should throw an exception with exit code 134 at runtime.
        let s: String = "Invalid*Base64";
        // Trigger a runtime conversion from Base64 (via asSlice()) and then decode
        let _ : Slice = s.asSlice().fromBase64();
        // If no exception is thrown, dump 0
        dump(0);
    }
}
