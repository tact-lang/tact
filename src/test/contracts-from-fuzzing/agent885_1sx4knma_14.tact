struct NestedBool {
    a: Bool;
    b: Bool?;
    c: Bool;
}

struct Outer {
    inner1: NestedBool;
    inner2: NestedBool?;
}

contract TestContract {
    compound: Outer;

    init() {
        self.compound = Outer{
            inner1: NestedBool{
                a: true,
                b: null,
                c: false,
            },
            inner2: null,
        };
    }
}