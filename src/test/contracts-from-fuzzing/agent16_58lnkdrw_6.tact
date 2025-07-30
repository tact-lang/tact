contract TestStringBuilderConcat {
    receive() {
        let sb: StringBuilder = beginString();
        sb = sb.concat("Hello, ");
        sb = sb.concat("Tact!");
        let s: String = sb.toString();
    }
}
