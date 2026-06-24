struct ThreeLevels {
    first: Int;
    second: Inner;
    third: Outer;
}

struct Inner {
    value: Int;
}

struct Outer {
    nested: Inner;
}

contract TestContract {
    data: ThreeLevels;

    init() {
        self.data = ThreeLevels{
            first: 1,
            second: Inner{ value: 2 },
            third: Outer{ nested: Inner{ value: 3 } },
        };
    }
}