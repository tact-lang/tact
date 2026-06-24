contract Test {
    receive() {
        // Test string building using StringBuilder
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", World!\nNew line and tab:\tDone.");
        let s: String = sb.toString();
        
        // Use string equality and asSlice
        if (s == "Hello, World!\nNew line and tab:\tDone.") {
            // match expected
        } else {
            // mismatch
        }
    }
}
