contract TestOverlapReceivers {
    receive("hello") {
        // exact match for "hello"
    }

    receive(str: String) {
        // fallback for arbitrary text messages that are not "hello"
    }
}
