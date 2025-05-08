struct Inner {
    id: Int as uint17;
    flag: Bool;
}

struct Outer {
    info: Inner;
    count: Int;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            info: Inner{ id: 12345, flag: true },
            count: 42
        };
    }
}