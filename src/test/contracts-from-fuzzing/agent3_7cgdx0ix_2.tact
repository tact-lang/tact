contract TestIfValid {
    receive() {
        // Valid if statement with proper curly braces
        if (true) { dump(1); }
    }
}
