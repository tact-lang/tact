contract Test {
    receive() {
        // Test: empty string literal and its operations
        let empty: String = "";
        let sb: StringBuilder = beginString();
        sb.append(empty);
        let result: String = sb.toString();
        let dummy: Int = empty.hashData() + result.hashData();
    }
}
