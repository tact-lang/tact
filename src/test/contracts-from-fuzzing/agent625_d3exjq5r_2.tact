struct Child {
    d: Int;
    e: Bool;
    f: String;
}

struct Parent {
    a: Int;
    b: Bool;
    c: Child;
}

contract Test {
    p: Parent;

    init() {
        self.p = Parent{
            a: 2,
            b: false,
            c: Child{ d: 3, e: true, f: "str" }
        };
    }
}