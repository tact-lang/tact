contract TestStringConcatBuilder {
    receive() {
        // Testing string concatenation using StringBuilder.concat
        let sb: StringBuilder = beginString();
        sb = sb.concat("Hello, ");
        sb = sb.concat("world!");
        let result: String = sb.toString();
    }
}
