contract Test {
    receive() {
        // Build a string using StringBuilder and compare it with a literal
        let sb: StringBuilder = beginString();
        sb.append("abc");
        let s: String = sb.toString();
        
        if (s == "abc") {
            dump("match");
        } else {
            dump("mismatch");
        }
    }
}
