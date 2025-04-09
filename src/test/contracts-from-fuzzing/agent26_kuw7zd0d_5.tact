contract TestConcat {
    receive() {
        // Testing string concatenation using StringBuilder
        let sb: StringBuilder = beginString();
        sb.append("Hello, ");
        sb.append("World!");
        let result: String = sb.toString();
    }
}
