contract TestContract {
    receive() {
        let sb = beginString();
        sb.append("Hello");
    }
}
