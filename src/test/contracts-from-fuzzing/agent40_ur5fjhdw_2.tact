contract TestStringConcat {
    receive() {
        let b: StringBuilder = beginString();
        b.append("Hello, ");
        b.append("World!");
        dump(b.toString());
    }
}