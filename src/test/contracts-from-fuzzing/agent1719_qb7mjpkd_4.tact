struct InnerA {
    foo: Int?;
    label: String;
}

struct InnerB {
    bar: Bool;
    desc: String?;
}

struct Outer {
    a: InnerA;
    b: InnerB;
    note: String;
}

contract NestedSiblings {
    s: Outer;

    init() {
        self.s = Outer{
            a: InnerA{ foo: 12, label: "L" },
            b: InnerB{ bar: true, desc: null },
            note: "done"
        };
    }
}