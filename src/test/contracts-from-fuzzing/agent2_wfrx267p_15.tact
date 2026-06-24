contract Test {
    receive() {
        // Test using StringBuilder to build a string and then converting it back to String
        let builder: StringBuilder = beginString();
        builder.append("Hello, ");
        builder.append("Tact!");
        let s: String = builder.toString();
        
        // Verify the built string equals the expected literal
        if (s != "Hello, Tact!") {
            // Force evaluation to use s in some computation
            let dummy: Int = s.hashData();
        }
    }
}
