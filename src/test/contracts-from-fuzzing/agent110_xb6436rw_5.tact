contract TestFallback {
    state: Int = 0;
    
    receive(msg: Slice) {
         // Fallback receiver: all unmatched binary messages are handled here.
         self.state = 99;
    }
}