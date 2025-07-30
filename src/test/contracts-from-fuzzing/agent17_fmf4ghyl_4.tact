contract Test {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", ");
        sb.append("Tact!");
        dump(sb.toString());
    }
}
