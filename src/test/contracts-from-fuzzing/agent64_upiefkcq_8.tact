message UniverseCalls {}

contract TestUnderscoreReceiver {
    // Receiver using underscore to discard the parameter
    receive(_: UniverseCalls) {
        // do nothing
    }
}

// Minimal contract to test underscore usage in receiver parameter