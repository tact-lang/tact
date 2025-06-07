contract Test {
    // Test 22: Bounced receiver using underscore to discard the parameter
    bounced(_: Slice) {
        // Handling all bounced messages without using the parameter
    }

    receive() {
        // Empty receiver to complete the contract
    }
}
