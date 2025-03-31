fun foo(s: String): String {
    return s;
}

contract Test {
    receive() {
        let s = foo("Hello");
        dump(s);
    }
}