struct S1 {
    a: Int;
}

struct S2 {
    b: S1?;
}

contract OptStructField {
    s: S2;

    init() {
        self.s = S2{
            b: null
        };
    }
}
