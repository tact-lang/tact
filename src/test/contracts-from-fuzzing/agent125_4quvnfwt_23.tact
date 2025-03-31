message MyMsg { value: Int; }

contract Test {
    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // Fallback handling
    }
    
    // Empty message receiver for transactions without any extra data / comment
    receive() {
        // Empty message handling
    }

    // Literal receiver for exact comment "hello"
    receive("hello") {
        // Literal text handling
    }

    // Dynamic text receiver for any text message that is not an exact literal
    receive(txt: String) {
        // Dynamic text handling
    }

    // Receiver for a typed message
    receive(msg: MyMsg) {
        // Typed message handling
    }
}
