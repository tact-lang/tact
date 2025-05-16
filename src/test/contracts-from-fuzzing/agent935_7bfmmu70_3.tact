struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Outer {
    x: Int;
    y: Inner?;
}

contract C {
    info: Outer;

    init() {
        self.info = Outer{
            x: 42,
            y: Inner{
                foo: null,
                bar: true,
            },
        };
    }

    receive() {}
}