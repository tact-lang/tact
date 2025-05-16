contract TestStringBuilderConcat {
    receive() {
        // Using StringBuilder.concat to build a string
        let sb: StringBuilder = beginString();
        sb = sb.concat("Hello,");
        sb = sb.concat(" World!");
        let s: String = sb.toString();
        s;
    }
}
