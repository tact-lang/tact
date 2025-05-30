contract TestStringConcat {
    receive() {
        // Using StringBuilder for string concatenation
        let sb: StringBuilder = beginString();
        sb = sb.concat("Hello, ");
        sb = sb.concat("Tact!");
        let s: String = sb.toString();
    }
}
