fun greetQuotes(): String {
    return "He said, \"Hello!\".";
}

contract Test {
    receive() {
        greetQuotes();
    }
}