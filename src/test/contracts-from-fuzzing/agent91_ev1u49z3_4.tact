contract TestStringBuilder {
    receive() {
        // Testing string concatenation using StringBuilder
        let sb: StringBuilder = beginString();
        sb.append("Hello ");
        sb.append("World!");
        let s: String = sb.toString();
        // Convert to slice to enforce full compilation
        let _ = s.asSlice();
    }
}
