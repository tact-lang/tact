fun getString(): String {
    return "Hello, Tact!";
}

contract TestContract {
    receive() {
        let s = getString();
    }
}
