struct InnerS { a: Int; b: Bool }

struct Container {
    x: Int;
    y: String?;
    z: InnerS?;
}

contract OptionalStructField {
    foo: Container;

    init() {
        self.foo = Container{
            x: 55,
            y: null,
            z: null
        };
    }
}