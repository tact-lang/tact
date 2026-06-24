struct StructA {
    foo: Int;
    bar: Bool?;
}

struct StructB {
    baz: String;
    optStructA: StructA?;
}

contract OptionalNestedStruct {
    s: StructB;
    init() {
        self.s = StructB{
            baz: "hi",
            optStructA: null
        };
    }
}