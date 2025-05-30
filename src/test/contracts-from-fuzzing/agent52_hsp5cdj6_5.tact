contract Test {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Hello, Tact!");
        let s: String = sb.toString();
        dump(s);
    }
}
