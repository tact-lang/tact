struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    x: Int;
    y: Int;
    nested: Inner;
}

contract ComplexStorage {
    data: Outer;

    init() {
        self.data = Outer{
            x: 1,
            y: 2,
            nested: Inner{
                a: 3,
                b: null,
            },
        };
    }
}