struct Inner {
    x: Int;
}

contract OptionalNestedInsideOptional {
    nestedOpt: Inner?;
    
    init() {
        self.nestedOpt = null;
    }
}