struct Nested {
    a: Int;
    b: Bool;
    c: Inner;
}

struct Inner {
    x: Int;
    y: String;
    z: Bool?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            a: 1,
            b: true,
            c: Inner{
                x: 2,
                y: "hi",
                z: null,
            },
        };
    }
}