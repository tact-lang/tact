struct InnerA {
    foo: Int;
}

struct InnerB {
    bar: Bool;
}

struct InnerC {
    baz: String;
}

contract MultiInnerStructs {
    a: InnerA;
    b: InnerB;
    c: InnerC;

    init() {
        self.a = InnerA{ foo: 1 };
        self.b = InnerB{ bar: true };
        self.c = InnerC{ baz: "hai" };
    }
}