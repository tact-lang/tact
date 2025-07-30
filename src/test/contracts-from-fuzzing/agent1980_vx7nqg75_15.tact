struct StructA {
    a: Int;
    b: Bool?;
}

struct StructB {
    c: String;
    d: StructA;
}

contract NestedStructFields {
    data: StructB;

    init() {
        self.data = StructB{
            c: "hello",
            d: StructA{ a: 42, b: null }
        };
    }
}