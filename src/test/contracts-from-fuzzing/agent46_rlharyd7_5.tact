contract TestContract {
    receive() {
        let s: String = "Hello, \nWorld!";
        let s2: String = "More text";
        let combined: StringBuilder = beginString();
        combined.append(s);
        combined.append(s2);
        let finalString: String = combined.toString();
    }
}