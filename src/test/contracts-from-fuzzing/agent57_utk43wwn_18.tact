contract Test {
    receive() {
        // Test L: Using StringBuilder.append to build a string (chained appends)
        let sb: StringBuilder = beginString();
        sb.append("Appending ");
        sb.append("via append");
        dump(sb.toString());
    }
}
