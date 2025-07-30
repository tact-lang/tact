// Nested struct with selective serialization hints and optionals
struct InnerSerOpt {
    foo: Int as uint3;
    bar: Bool?;
    baz: String;
}

contract ComboNested {
    field: InnerSerOpt;
    
    init() {
        self.field = InnerSerOpt{foo: 7, bar: null, baz: "x"};
    }
}