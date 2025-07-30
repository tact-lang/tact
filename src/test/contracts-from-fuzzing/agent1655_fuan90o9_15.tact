struct StructA {
    foo: Int;
    bar: String;
}

struct StructB {
    nestedA: StructA;
    baz: Bool;
    nestedOpt: StructA?;
}

contract RefMultipleStructs {
    first: StructA;
    second: StructB;

    init() {
        self.first = StructA{ foo: 10, bar: "hi" };
        self.second = StructB {
            nestedA: self.first,
            baz: true,
            nestedOpt: null
        };
    }
}
