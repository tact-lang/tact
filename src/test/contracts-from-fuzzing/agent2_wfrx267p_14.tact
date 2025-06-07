contract Test {
    receive() {
        // Test symmetry of string conversion: cast string to slice and back to string
        let s: String = "Symmetry test: \u{1F602} \u{1F44D}";  // "😂 👍"
        let s2: String = s.asSlice().asString();
        
        // Check for equality: if they differ, then there's a bug in conversion
        if (s != s2) {
            // This dummy hashData call forces evaluation
            let issue: Int = s.hashData() + s2.hashData();
        }

        // Force use of s2 to avoid unused variable warnings
        let _dummy: Int = s2.hashData();
    }
}
