contract NestedStructsAndFields {
    struct1: StructOne;
    struct2: StructTwo;

    init() {
        self.struct1 = StructOne{ a: 1, b: true };
        self.struct2 = StructTwo{ x: "hello", y: false };
    }
}

struct StructOne {
    a: Int;
    b: Bool;
}

struct StructTwo {
    x: String;
    y: Bool;
}