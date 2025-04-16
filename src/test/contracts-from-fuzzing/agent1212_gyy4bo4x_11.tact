struct S1 {
    a: Int = 1;
    b: Int = 2;
}

struct S2 {
    c: Int = 3;
    d: S1;
    e: Bool = true;
}

contract NestedDefaults {
    w: S2;
    init() {
        self.w = S2{
            d: S1{},
        };
    }
}