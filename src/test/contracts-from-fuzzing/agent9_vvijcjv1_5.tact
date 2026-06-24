contract TestIf {
    receive() {
        // Simple if: condition true
        if (true) {
            dump(100);
        }
    }
}
