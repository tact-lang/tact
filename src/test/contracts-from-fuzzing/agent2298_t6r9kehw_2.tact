struct Inner {
    val1: Int;
    flag: Bool;
    note: String?;
}

struct Outer {
    id: Int;
    info: Inner;
    status: Bool;
}

contract ComplexNested {
    state: Outer;

    init() {
        self.state = Outer{
            id: 42,
            info: Inner{ val1: 10, flag: false, note: null },
            status: true,
        };
    }
}