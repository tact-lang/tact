contract Test {
    receive() {
        let sb: StringBuilder = beginString();
        sb = sb.concat("Hello, ");
        sb = sb.concat("world!");
        let s: String = sb.toString();
    }
}
