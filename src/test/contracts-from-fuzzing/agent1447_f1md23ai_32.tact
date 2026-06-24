struct OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptPrim {
    v: OptionalPrimitives;
    
    init() {
        self.v = OptionalPrimitives{ i: null, b: true, s: null };
    }
}