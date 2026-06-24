message M {
    x: Int;
}

contract Test {
    // Generic text message receiver
    receive(str: String) {
        // handle arbitrary text
    }

    // Literal text message receiver for "testing"
    receive("testing") {
        // handle specific text
    }

    // Receiver for typed binary message M
    receive(msg: M) {
        // handle typed binary message
    }

    // Fallback receiver for unmatched binary messages (Slice)
    receive(msg: Slice) {
        // fallback handling
    }

    // Receiver for empty messages
    receive() {
        // handle empty messages
    }
}
