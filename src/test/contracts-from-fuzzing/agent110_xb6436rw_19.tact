contract TestExternal {
    state: Int = 0;
    
    // External receiver: for off-chain invocation (cannot reply, no sender available)
    external("hello, it's me") {
         self.state = 123;
    }
}
