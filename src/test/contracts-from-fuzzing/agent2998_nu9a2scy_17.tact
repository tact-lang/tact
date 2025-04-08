struct Middle {
    d: Int;
    e: Int?;
}

struct Outer {
    a: Int;
    b: Bool;
    c: Middle;
}

contract NestedWithOptionals {
    field: Outer;
    init() {
        self.field = Outer{
            a: 1,
            b: false,
            c: Middle{
                d: 7,
                e: null,
            },
        };
    }
}