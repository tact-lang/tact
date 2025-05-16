fun echo(s: String): String {
    return s;
}

contract Test {
    receive() {
        echo("Hello from Tact");
    }
}
