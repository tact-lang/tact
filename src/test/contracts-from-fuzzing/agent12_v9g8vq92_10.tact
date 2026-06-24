contract TestContract {
    // Test 7: Using StringBuilder to concatenate strings and then converting to String
    receive() {
        let b: StringBuilder = beginString();
        b.append("Hello, ");
        b.append("Tact!");
        let s: String = b.toString();
    }
}
