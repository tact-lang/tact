struct InnerNested {
    x: Int;
    y: Bool;
}

struct OuterNested {
    nested: InnerNested;
    flag: Bool;
}

contract TestContract2 {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            nested: InnerNested{x: 3, y: false},
            flag: true
        };
    }
}