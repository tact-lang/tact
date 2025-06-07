struct S2 {
    f: Int?;
}

struct S1 {
    g: S2?;
}

contract NestedOptionalStructs {
    s: S1?;

    init() {
        self.s = null;
    }
}