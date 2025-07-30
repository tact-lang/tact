contract TestStringConcat {
    receive() {
        let sb: StringBuilder = beginString().concat("foo").concat("bar");
        let s: String = sb.toString();
        require(s == "foobar", "Concat error");
    }
}
