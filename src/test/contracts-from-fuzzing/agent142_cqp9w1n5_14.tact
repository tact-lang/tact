message A {
    a: Int;
}

contract Test {
    // 1. Empty message receiver
    receive() {
        // Handle empty messages
    }

    // 2. Literal text receiver for exactly "hello"
    receive("hello") {
        // Handle "hello" messages specifically
    }

    // 3. Arbitrary text message receiver
    receive(str: String) {
        // Handle any text message
    }

    // 4. Typed binary message receiver for messages of type A
    receive(msg: A) {
        let x = msg.a; // Ensure usage
    }

    // 5. Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Handle any binary message not matching previous patterns
    }
}
