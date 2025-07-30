contract TestConcat {
    receive() {
        let b: StringBuilder = beginString();
        b.append("Hello, ");
        b.append("world!");
        let s: String = b.toString();
        dump(s);
    }
}
