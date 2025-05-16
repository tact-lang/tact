struct InnerA {
    foo: Int;
}

struct InnerB {
    bar: String;
}

struct Outer {
    a: InnerA;
    b: InnerB;
}

contract MultipleNestedStructs {
    s: Outer;

    init() {
        self.s = Outer{ a: InnerA{ foo: 7 }, b: InnerB{ bar: "hey" } };
    }
}