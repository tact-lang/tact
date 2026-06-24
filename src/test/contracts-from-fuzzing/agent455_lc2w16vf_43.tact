struct SEnd {
    v: Int;
}

struct S2End {
    a: Int;
    b: String;
    tail: SEnd;
}

contract NestedEnd {
    d: S2End;
    init() {
        self.d = S2End{
            a: 3,
            b: "tail",
            tail: SEnd{v: 999},
        };
    }
}