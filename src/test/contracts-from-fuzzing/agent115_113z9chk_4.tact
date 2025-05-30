contract TestStringConcat {
    receive() {
        // Testing string concatenation using StringBuilder functions
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", ");
        sb.append("World!");
        let s: String = sb.toString();
        dump(s.asSlice());
    }
}
