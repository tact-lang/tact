struct InnerMost {
    x: Int;
}

struct Mid {
    inner: InnerMost;
    flag: Bool;
}

struct Outer {
    a: Mid;
    b: Mid;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: Mid{ inner: InnerMost{ x: 1 }, flag: true },
            b: Mid{ inner: InnerMost{ x: 2 }, flag: false },
        };
    }
}