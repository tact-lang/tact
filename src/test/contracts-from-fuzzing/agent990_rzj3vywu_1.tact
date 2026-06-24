struct Inner {
    value: Int;
    flag: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    description: String;
    active: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{ value: 1, flag: true },
            inner2: Inner{ value: 2, flag: false },
            description: "test",
            active: true,
        };
    }
}