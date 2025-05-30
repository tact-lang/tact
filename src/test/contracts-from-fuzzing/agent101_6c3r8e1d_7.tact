contract TestContract {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", ");
        sb.append("World!");
        let s: String = sb.toString();
    }
}
