contract Test {
    receive() {
        let s1: String = "Hello, ";
        let s2: String = "Tact!";
        let builder: StringBuilder = beginString();
        builder.append(s1);
        builder.append(s2);
        let res: String = builder.toString();
    }
}
