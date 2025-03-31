contract TestEmpty {
    // Test empty receiver for empty messages
    receive() {
        // do nothing
    }

    // Include a referenced getter function
    get fun test(): Int {
        return 0;
    }
}
