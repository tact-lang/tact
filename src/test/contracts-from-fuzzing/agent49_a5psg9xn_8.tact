contract TestStringBuilder {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", ");
        sb.append("World!");
        dump(sb.toString());
    }
}
