contract TestContract {
    receive() {
        // Valid if statement with correct curly braces
        if (true) { dump(1); }
    }
}
