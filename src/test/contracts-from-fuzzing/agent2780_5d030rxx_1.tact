struct InnerNested {
    a: Int;
    b: String;
    c: Bool?; 
}

struct OuterNested {
    nest: InnerNested;
    d: Int?;
    e: String;
}

contract NestedStructContract {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            nest: InnerNested{
                a: 1,
                b: "test",
                c: true,
            },
            d: 2,
            e: "outer",
        };
    }
}