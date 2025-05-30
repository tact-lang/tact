struct InnerNested {
    x: Int;
    y: Int?;
}

struct OuterNested {
    a: InnerNested;
    b: Bool?;
}

contract TestContract {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            a: InnerNested{ x: 1, y: null },
            b: true
        };
    }
}