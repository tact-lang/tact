contract Test {
    receive() {
        // Build a string using a StringBuilder then invoke hashData extension
        let sb: StringBuilder = beginString();
        sb.append("Test!");
        let s: String = sb.toString();
        let h: Int = s.hashData();
        dump(h);
    }
}
