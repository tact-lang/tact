contract Test3 {
    // Testing string receiver: this should trigger on any arbitrary text message
    receive(str: String) {
        // Handle arbitrary text messages
    }

    get fun dummy(): Int {
        return 7;
    }
}
