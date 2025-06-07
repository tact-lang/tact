message BounceData {
    dummy: Int;
}

contract BounceChainer {
    counter: Int = 0;

    bounced(msg: bounced<BounceData>) {
        // Increase a counter to record bounce occurrence
        self.counter += 1;
        
        // Attempt to use sender() in bounce context
        self.forward(sender(), "Bounce chain trigger".asComment(), true, null);
    }
}
