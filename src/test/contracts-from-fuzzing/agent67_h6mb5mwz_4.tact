contract AdvancedStringTest {
    receive() {
        let s: String = "Base64 Test";
        // Convert to base64
        let b64: String = s.asSlice().fromBase64().asString();
        // Compare original with converted
        if (s == b64) {
            dump("Strings match.");
        } else {
            dump("Strings do not match.");
        }
    }
}