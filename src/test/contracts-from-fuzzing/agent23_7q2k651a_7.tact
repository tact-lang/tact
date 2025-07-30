contract Test {
    // Fallback receiver: handles all unmatched binary messages
    receive(msg: Slice) {
        // dummy processing: no-op
    }
    
    get fun dummy(): Int {
        return 0;
    }
}
