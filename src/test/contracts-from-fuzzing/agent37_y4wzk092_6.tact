contract TestStringConcat {
    receive() {
        // Testing concatenation via StringBuilder since direct '+' might not be supported for strings
        let b: StringBuilder = beginString();
        b.append("Hello, ");
        b.append("World!");
        let s: String = b.toString();
    }
}
