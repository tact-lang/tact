struct InnerNested {
    a: Int;
    b: Bool;
    c: String;
}

struct OuterNested {
    one: Int;
    two: InnerNested;
    three: Bool;
}

contract NestedContract {
    field: OuterNested;
    
    init() {
        self.field = OuterNested{
            one: 1,
            two: InnerNested{
                a: 2,
                b: true,
                c: "hello",
            },
            three: false,
        };
    }
}