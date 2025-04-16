struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer = Outer{ nested: Inner{ x: 1, y: true }, flag: false };

    init() {
        self.data = Outer{
            nested: Inner{ x: 42, y: false },
            flag: true
        };
    }
}