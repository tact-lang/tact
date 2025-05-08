struct Inner {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: String;
}

struct Mid {
    x: Inner;
    y: Bool;
}

struct Outer {
    a: Mid;
    b: Inner;
    c: Int;
}

contract NestedMix {
    store: Outer;

    init() {
        self.store = Outer{
            a: Mid{
                x: Inner{ f1: 1, f2: null, f3: false, f4: "hi" },
                y: true
            },
            b: Inner{ f1: 2, f2: 3, f3: true, f4: "bye" },
            c: 5
        };
    }
}