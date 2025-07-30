struct Inner {
    a: Int?;
    b: Bool;
}

struct Outer {
    innerField: Inner;
    extra: String;
}

contract Test {
    store: Outer;
    init() {
        self.store = Outer{ innerField: Inner{ a: null, b: true }, extra: "hi" };
    }
}
