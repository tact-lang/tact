contract TestContract {
    receive() {
        let sb = beginString();
        sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJK");
        let result = sb.toString();
    }
}
