struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    x: Inner?;
    y: Int;
}

contract OptionalStructField {
    data: Outer;

    init() {
        self.data = Outer{
            x: null,
            y: 7
        };
    }
}