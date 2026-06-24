struct Middle {
    foo: Int;
    bar: String?;
}

struct Container {
    a: Middle;
    b: Middle?;
}

contract OptionalStructFields {
    data: Container;

    init() {
        self.data = Container{
            a: Middle{ foo: 1, bar: null },
            b: null
        };
    }
}
