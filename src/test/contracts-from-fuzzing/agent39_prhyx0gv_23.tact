trait ReceiverTrait {
    // Trait-based receiver for the specific text message "trait"
    receive("trait") {
        // trait receiver logic
    }
}

contract Test with ReceiverTrait {
    // Contract receiver for empty messages
    receive() {
        // contract receiver logic
    }

    // Additionally, a receiver for arbitrary text messages
    receive(str: String) {
        // handles all text messages not matching "trait"
    }
}
