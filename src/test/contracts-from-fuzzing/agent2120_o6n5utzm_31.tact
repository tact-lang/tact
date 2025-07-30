struct Inner {
    value: Int?;
}

contract OptionalChain {
    storage: Inner?;
    
    init() {
        self.storage = null;
    }
}