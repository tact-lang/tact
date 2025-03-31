contract TestContract {
    receive() {
        let s: String = "Hello, World!";
        let newStr: StringBuilder = beginString();
        newStr.append(s);
        newStr.append(" Welcome to Tact.");
        let finalResult: String = newStr.toString();
    }
}