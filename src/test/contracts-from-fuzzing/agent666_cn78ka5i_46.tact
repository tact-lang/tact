struct Inner {
    flag: Bool = false;
    text: String = "inside";
    optionalInt: Int? = null;
}

struct Outer {
    inner: Inner;
    note: String = "outer";
    present: Bool = true;
}

contract NestMix {
    store: Outer;

    init() {
        self.store = Outer{
            inner: Inner{},
            note: "outer",
            present: true
        };
    }
}
