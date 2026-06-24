struct InnerNested {
    ii: Int;
    bb: Bool?;
}

struct OuterNested {
    f1: Int;
    nested: InnerNested;
}

contract NestedStructStorage {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            f1: 5,
            nested: InnerNested{
                ii: 10,
                bb: true,
            },
        };
    }

    receive() {
        let t = self.data;
    }
}