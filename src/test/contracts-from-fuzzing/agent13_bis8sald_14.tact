message MyMsg { x: Int; }

contract Test {
    // 1. Receiver for empty messages
    receive() { 
        // logic for empty message
    }
    
    // 2. Receiver for specific text comment "greeting"
    receive("greeting") { 
        // logic for greeting comment
    }
    
    // 3. Receiver for arbitrary text messages
    receive(str: String) {
        // logic for arbitrary text
    }
    
    // 4. Receiver for typed binary messages
    receive(msg: MyMsg) {
        // logic for typed message MyMsg
    }
    
    // 5. Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // fallback logic
    }
}
