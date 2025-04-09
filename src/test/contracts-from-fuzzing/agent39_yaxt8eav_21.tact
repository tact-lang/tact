struct NestedA {
    inner: Int;
}

struct NestedB {
    a: NestedA;
}

struct NestedC {
    b: NestedB;
    text: String;
}

contract MultiNest {
    foo: NestedC;

    init() {
        self.foo = NestedC{
            b: NestedB{
                a: NestedA{ inner: 99 },
            },
            text: "nest",
        };
    }
}