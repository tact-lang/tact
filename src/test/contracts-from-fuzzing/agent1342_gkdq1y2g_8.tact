struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    optInt: Int?;
}

contract NestedOptionals {
    store: S2;

    init() {
        self.store = S2{
            s1: S1{ a: 42 },
            optInt: null
        };
    }
}