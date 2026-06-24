struct S1 {
    a: Int;
}

struct S2 {
    b: String;
}

struct TupleWrapper {
    s1: S1?;
    s2: S2?;
}

contract OptionalTupleTest {
    pair: TupleWrapper?;

    init() {
        self.pair = TupleWrapper{
            s1: null,
            s2: S2{ b: "hi" },
        };
    }
}
