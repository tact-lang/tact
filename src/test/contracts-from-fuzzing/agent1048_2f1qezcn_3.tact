struct NestedA {
    a: Int;
    b: Bool?;
}

struct NestedB {
    x: Int;
    y: NestedA;
}

struct NestedC {
    m: NestedB;
    n: Bool;
}

contract MultiNested {
    data: NestedC;

    init() {
        self.data = NestedC{
            m: NestedB{
                x: 1,
                y: NestedA{
                    a: 2,
                    b: null,
                },
            },
            n: true,
        };
    }
}