message MyMsg { value: Int; }

contract Test {
    // Dynamic text receiver declared first
    receive(s: String) {
        // Dynamic text handling
    }

    // Empty message receiver declared second
    receive() {
        // Empty message handling
    }

    // Fallback receiver declared third
    receive(msg: Slice) {
        // Fallback binary handling
    }

    // Receiver for a typed message declared fourth
    receive(msg: MyMsg) {
        // Typed message handling
    }

    // Literal text receiver declared last
    receive("hello") {
        // Literal text handling
    }
}
