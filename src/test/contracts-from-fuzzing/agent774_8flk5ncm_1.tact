contract TestContract {
    s: StructA;
    init() {
        self.s = StructA{ i: 1, nested: StructB{ f: false, inner: StructC{ x: 123, str: "test" } } };
    }
}

struct StructA {
    i: Int;
    nested: StructB;
}

struct StructB {
    f: Bool;
    inner: StructC;
}

struct StructC {
    x: Int;
    str: String;
}