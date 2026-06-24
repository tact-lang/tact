struct InnerNested {
    a: Int;
    b: Int;
}

struct OuterNested {
    x: Int;
    nested: InnerNested;
    y: Int;
}

contract NestedInMiddle {
    data: OuterNested;

    init() {
        self.data = OuterNested{ x:0, nested: InnerNested{a:1,b:2}, y:3 };
    }
}
