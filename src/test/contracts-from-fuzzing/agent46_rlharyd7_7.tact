contract TestContract {
    receive() {
        let s: String = "Hello, World!";
        let newString: StringBuilder = beginString();
        newString.append(s);
        newString.append(" Have a nice day!");
        let result: String = newString.toString();
    }
}