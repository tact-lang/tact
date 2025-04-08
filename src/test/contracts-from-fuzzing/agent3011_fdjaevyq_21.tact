struct OptionalAggregation {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract MegaOptionalStruct {
    foo: OptionalAggregation;
    init() {
        self.foo = OptionalAggregation{ a:null, b:null, c:null,d:null };
    }
}