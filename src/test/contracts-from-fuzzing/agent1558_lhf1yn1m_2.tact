struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
    value: Int?;
}

contract TestContract {
    param: Outer;

    init() {
        self.param = Outer{
            nested: Inner{ x: 1, y: false },
            flag: true,
            value: null,
        };
    }
}
