struct InnerDup {
    x: Int;
}

struct OuterDup {
    a: InnerDup;
    b: InnerDup;
}

contract SameStructFields {
    dup: OuterDup;

    init() {
        self.dup = OuterDup{
            a: InnerDup{x: 1},
            b: InnerDup{x: 2}
        };
    }
}