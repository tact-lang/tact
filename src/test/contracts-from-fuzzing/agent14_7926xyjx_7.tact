fun greetUnicode(): String {
    return "Hello 👋✨🌍";
}

contract Test {
    receive() {
        greetUnicode();
    }
}