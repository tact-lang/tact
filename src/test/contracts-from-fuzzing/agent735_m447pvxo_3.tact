struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract DeepOptional {
    pair: Outer;

    init() {
        self.pair = Outer{
            first: Inner{a: 1, b: null},
            second: Inner{a: 2, b: true}
        };
    }
}