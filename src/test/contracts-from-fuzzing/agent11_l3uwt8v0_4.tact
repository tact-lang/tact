fun echo(s: String): String {
    return s;
}

contract Test1 {
    receive() {
        let res: String = echo("Hello, Tact");
    }
}
