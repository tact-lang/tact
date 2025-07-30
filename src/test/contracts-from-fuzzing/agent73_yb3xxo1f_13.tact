contract Test {
    receive() {
        // Testing StringBuilder.concat chaining and conversion to String
        let sb: StringBuilder = beginString();
        sb = sb.concat("hello").concat(" world");
        let s: String = sb.toString();
        if (s != "hello world") {
            throw(123); // unexpected concatenation result
        }
    }
}
