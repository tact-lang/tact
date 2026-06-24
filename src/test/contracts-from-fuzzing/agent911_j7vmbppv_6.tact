struct BigNested {
    f1: Int;
    f2: NestedA;
    f3: NestedB;
}

struct NestedA {
    a1: Int;
    a2: Bool;
}

struct NestedB {
    b1: String;
    b2: Int?;
}

contract TestBigNested {
    payload: BigNested;

    init() {
        self.payload = BigNested{
            f1: 55,
            f2: NestedA{
                a1: 10,
                a2: true
            },
            f3: NestedB{
                b1: "test",
                b2: null
            }
        };
    }
}