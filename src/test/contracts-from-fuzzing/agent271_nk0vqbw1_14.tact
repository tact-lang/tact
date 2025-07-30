struct Inner {
    f: Bool;
}

struct Outer {
    optInner: Inner?;
    num: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            optInner: Inner{ f: true },
            num: 123
        };
    }
}