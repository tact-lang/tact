struct S1 {
    a: Int?;
}

struct S2 {
    b: S1?;
}

contract NestedOptionals {
    s: S2?;

    init() {
        self.s = null;
    }
}