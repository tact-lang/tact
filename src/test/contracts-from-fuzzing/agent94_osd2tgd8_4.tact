contract TestConcat {
    // This contract tests runtime concatenation of strings using the StringBuilder.
    receive() {
        let s1: String = "Hello, ";
        let s2: String = "World!";
        let sb: StringBuilder = beginString();
        sb.append(s1);
        sb.append(s2);
        let result: String = sb.toString();
        result;
    }
}
