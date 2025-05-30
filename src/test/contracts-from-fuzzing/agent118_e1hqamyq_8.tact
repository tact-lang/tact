contract TestOverlap {
    // Test: Overlapping text receivers
    // Specific text literal receiver
    receive("hello") {
        // handle specific text message
    }

    // Arbitrary text receiver
    receive(str: String) {
        // handle arbitrary text message
    }
}
