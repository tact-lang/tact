struct Inner {
    x: Int;
    y: Bool;
    z: String;
    nested: Nested;
}

struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{
            x: 1,
            y: true,
            z: "test",
            nested: Nested{
                a: 99,
                b: false,
            },
        };
    }
}