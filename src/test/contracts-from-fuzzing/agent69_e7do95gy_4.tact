contract TestStringBuilderConcat {
    receive() {
        // Test 3: StringBuilder concatenation
        let sb: StringBuilder = beginString();
        sb.append("hello ");
        sb.append("world");
        let s: String = sb.toString();
    }
}
