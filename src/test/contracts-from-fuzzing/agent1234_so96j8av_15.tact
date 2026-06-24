struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract FullyOptional {
    data: OptionalInner?;
    
    init() {
        // no explicit assign, should default to null safely
    }
}