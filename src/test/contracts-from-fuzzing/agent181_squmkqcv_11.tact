struct S1 {
    a: Int;
}

struct S2 {
    b: Bool;
}

struct Holder {
    s1: S1?;
    s2: S2?;
}

contract TestDoubleNestedOpts {
    payload: Holder;

    init() {
        self.payload = Holder{
            s1: null,
            s2: S2{ b: true },
        };
    }
}
