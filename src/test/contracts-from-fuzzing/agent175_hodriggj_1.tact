contract Test1 {
    // Receiver for empty messages
    receive() {
        // do nothing
    }

    // dummy function to ensure full contract usage
    get fun getValue(): Int {
        return 0;
    }
}