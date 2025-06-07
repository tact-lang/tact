contract TestAsSlice {
    receive() {
        // Test conversion from String to Slice and back using asSlice()
        let original: String = "Converting to Slice and back! \n Newline and \t tab included.";
        let converted: String = original.asSlice().asString();
        if (original == converted) {
            original; // Return original if conversion preserves the string
        } else {
            converted; // Otherwise, return converted
        }
    }
}
