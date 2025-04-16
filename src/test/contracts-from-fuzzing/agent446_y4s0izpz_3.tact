struct Inner {
    foo: Int;
    bar: Bool;
}

struct Mid {
    one: Int;
    two: Inner;
}

struct Outer {
    m: Mid;
    x: Int;
    y: Bool;
}

contract Test {
    storage: Outer;

    init() {
        self.storage = Outer{
            m: Mid{
                one: 99,
                two: Inner{
                    foo: 77,
                    bar: false,
                },
            },
            x: 123,
            y: true,
        };
    }
}