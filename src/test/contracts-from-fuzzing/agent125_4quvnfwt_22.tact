message MyMsg { value: Int; }

contract Test {
    // Fallback receiver for binary messages, declared first
    receive(msg: Slice) {
        // Fallback handling
    }
    
    // Dynamic text receiver for any text message
    receive(s: String) {
        // Dynamic text handling
    }
    
    // Literal text receiver for the exact message "hello"
    receive("hello") {
        // Literal text handling
    }
    
    // Typed message receiver for messages of type MyMsg
    receive(msg: MyMsg) {
        // Typed message handling
    }
}
