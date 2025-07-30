contract TestSBAppend {
    receive() {
        // Test appending using StringBuilder.append with two separate strings
        let sb: StringBuilder = beginString();
        sb.append("Hello, ");
        sb.append("world!");
        dump(sb.toString());
    }
}
