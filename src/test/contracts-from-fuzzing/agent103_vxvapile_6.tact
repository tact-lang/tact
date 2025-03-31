contract TestStringBuilderConcat {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Hello, ");
        sb.append("Tact!");
        let s: String = sb.toString();
        dump(s);
    }
}
