contract TestContract {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append("; ");
        sb.append("Tact!");
        let result: String = sb.toString();
    }
}