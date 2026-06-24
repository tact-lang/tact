struct S1 {
    a: Int?;
}

struct S2 {
    x: S1?;
}

contract OptionalStructWrapper {
    s: S2;
    init() {
        self.s = S2{x: null};
    }
}