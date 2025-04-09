contract Test {
    receive() {
        let b: StringBuilder = beginString();
        b.append("Hello, ");
        b.append("TON!");
        let s: String = b.toString();
    }
}
