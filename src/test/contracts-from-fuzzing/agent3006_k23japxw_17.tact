struct InnerMost {
    f1: Int;
    f2: Bool;
}
struct Inner {
    rec: InnerMost;
    s: String;
}
struct Outer {
    recInner: Inner;
    flag: Bool;
}

contract Inception {
    data: Outer;

    init() {
        self.data = Outer {
            recInner: Inner {
                rec: InnerMost { f1: 42, f2: true },
                s: "in in in",
            },
            flag: false,
        };
    }
}
