struct StructA {
    foo: Int?;
    bar: Bool;
}

struct StructB {
    alpha: StructA?;
    beta: Int;
}

contract OptionalNested {
    record: StructB;

    init() {
        self.record = StructB{
            alpha: null,
            beta: 100
        };
    }
}