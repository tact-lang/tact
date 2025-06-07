struct StructA {
    value: Int;
}

struct StructB {
    a: StructA;
    b: String;
    c: Bool;
}

contract NestedStructContract {
    nested: StructB;

    init() {
        self.nested = StructB{
            a: StructA{ value: 123 },
            b: "test",
            c: true,
        };
    }
}