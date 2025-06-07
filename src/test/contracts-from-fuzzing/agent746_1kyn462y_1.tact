struct InnerNested {
    foo: Int;
    bar: Bool;
}

struct OuterNested {
    nested: InnerNested;
    text: String;
}

contract DeepStorage {
    nestedField: OuterNested;
    
    init() {
        self.nestedField = OuterNested{
            nested: InnerNested{foo: 1, bar: true},
            text: "Hello"
        };
    }
}