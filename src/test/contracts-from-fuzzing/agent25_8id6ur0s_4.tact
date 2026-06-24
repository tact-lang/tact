contract TestString3 {
    receive() {
        let greeting: String = "Hello, Tact!";
        let sb: StringBuilder = beginString();
        sb.append(greeting);
        sb.append(" Another part");
        let extended: String = sb.toString();
    }
}