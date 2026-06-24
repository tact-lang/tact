struct NestedA {
    optField: Int?;
    boolField: Bool;
}

struct NestedB {
    nestedA: NestedA?;
    x: Int;
}

contract OptionalInStruct {
    n: NestedB;

    init() {
        self.n = NestedB{
            nestedA: null,
            x: 99
        };
    }
}