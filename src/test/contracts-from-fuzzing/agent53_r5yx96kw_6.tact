contract Test {
    receive() {
        let sb: StringBuilder = beginString();
        sb = sb.concat("Hello ").concat("world!");
        let s: String = sb.toString();
    }
}
