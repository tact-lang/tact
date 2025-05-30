fun echo(s: String): String {
    return s;
}

contract TestContract {
    receive() {
        // Test passing string to a function and returning it
        let s: String = echo("Echo test string");
        dump(s);
    }
}
