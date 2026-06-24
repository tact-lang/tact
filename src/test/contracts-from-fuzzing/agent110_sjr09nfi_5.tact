contract TestStringBuilder {
    receive() {
        let b: StringBuilder = beginString();
        b.append("Hello ");
        b.append("World");
        let s: String = b.toString();
        dump(s);
    }
}
