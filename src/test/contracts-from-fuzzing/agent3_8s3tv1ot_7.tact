fun singleQuotes(): String {
    return "What's up?";
}

contract Test {
    receive() {
        let x = singleQuotes();
    }
}
