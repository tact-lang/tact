struct OptionalIntBool {
    x: Int?;
    y: Bool?;
}

contract OptionalPrimitiveFields {
    optData: OptionalIntBool;
    
    init() {
        self.optData = OptionalIntBool{x: null, y: null};
    }
    
    receive() {
        self.optData = OptionalIntBool{x: 42, y: true};
    }
}