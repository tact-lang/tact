struct Inner {
    flag: Bool;
}

struct Outer {
    nested: Inner?;
    count: Int;
}

contract C {
    payload: Outer;

    init() {
        self.payload = Outer{nested: null, count: 0};
    }
}