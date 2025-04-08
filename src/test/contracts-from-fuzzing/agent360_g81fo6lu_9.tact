struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    one: Inner;
    two: Inner;
}

contract NestedContract {
    main: Outer;

    init() {
        self.main = Outer{
            one: Inner{ x: 1, y: true },
            two: Inner{ x: 2, y: false },
        };
    }
}