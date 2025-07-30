contract TestStringBuilderConcat {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Part1, ");
        sb.append("Part2");
        let s: String = sb.toString();
        s;
    }
}
