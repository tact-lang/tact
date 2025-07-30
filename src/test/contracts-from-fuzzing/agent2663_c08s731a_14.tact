struct In1 {
    i: Int;
}

struct In2 {
    b: Bool;
    s: String;
}

struct NestedMulti {
    one: In1;
    two: In2;
    opt: In2?;
    flag: Bool;
}

contract NestedComplex {
    store: NestedMulti;

    init() {
        self.store = NestedMulti{
            one: In1{ i: 7 },
            two: In2{ b: true, s: "hi" },
            opt: null,
            flag: false
        };
    }
}