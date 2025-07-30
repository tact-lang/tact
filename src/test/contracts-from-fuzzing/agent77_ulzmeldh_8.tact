contract Test {
    receive() {
        // Using StringBuilder.concat to concatenate strings
        let sb: StringBuilder = beginString()
            .concat("Hello, ")
            .concat("Tact!");
        let s: String = sb.toString();
    }
}
