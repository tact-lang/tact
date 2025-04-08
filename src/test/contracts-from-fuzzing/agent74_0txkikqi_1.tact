struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{nested: Inner{a: 1, b: null}, flag: true};
    }
}