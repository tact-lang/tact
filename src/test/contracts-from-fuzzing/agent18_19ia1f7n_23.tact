contract Test {
    receive() {
        // Continuing the rigorous fuzz testing on string behaviors.
        // Test: Converting between String and Slice multiple times
        // This test combines several operations: concatenating multiple strings using StringBuilder,
        // converting to Slice via asSlice(), and then back to String via asString(), then comparing for equality.
        
        // Build a complex message using StringBuilder
        let sb: StringBuilder = beginString();
        sb.append("Part1: Hello, ");
        sb.append("Part2: Tact! ");
        sb.append("Emoji: \u{1F600}");
        let s1: String = sb.toString();

        // Convert the string to a slice and back, expecting to get the same string
        let s2: String = s1.asSlice().asString();
        
        // Dump the results and the comparison
        dump(s1);
        dump(s2);
        dump(s1 == s2);

        // Additionally, test strings with embedded escape sequences and accidental additional whitespaces
        let s3: String = "Line1\nLine2\nLine3";
        let s3_round: String = s3.asSlice().asString();
        dump(s3);
        dump(s3_round);
        dump(s3 == s3_round);

        // Final test: combine rawSlice with fromBase64
        // Create a cell from a Base64 encoded string, then convert the cell into a slice and into a string
        let base64Str: String = "SGVsbG8sIFRhdCE="; // "Hello, Tact!"
        let sliceFromBase64: Slice = base64Str.fromBase64();
        let s4: String = sliceFromBase64.asString();
        dump(s4);
    }
}
