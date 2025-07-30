struct Nested {
    foo: Int as uint8;
    bar: Int as int16;
}

struct Container {
    x: Bool;
    y: Nested;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            x: false,
            y: Nested{
                foo: 255,
                bar: -32768,
            },
        };
    }
}