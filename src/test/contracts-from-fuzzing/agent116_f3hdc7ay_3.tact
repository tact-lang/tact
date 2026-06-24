contract TestContract {
    receive() {
        // Test various escape sequences: newline, tab, double quote, backslash
        let s: String = "line\nnew line\twith tab \"quoted\" and a backslash \\";
    }
}
