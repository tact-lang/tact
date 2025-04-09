contract Test {
    receive() {
        // Test: string concatenation using StringBuilder
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", ");
        sb.append("Tact");
        let s: String = sb.toString();
    }
}
