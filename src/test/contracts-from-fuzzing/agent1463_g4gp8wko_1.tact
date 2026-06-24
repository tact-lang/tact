struct Nested {
    x: Int;
    y: String;
    z: Bool;
}

struct Outer {
    inner: Nested;
    optionalString: String?;
}

contract TestContract {
    content: Outer;

    init() {
        self.content = Outer{
            inner: Nested{
                x: 42,
                y: "hi",
                z: false,
            },
            optionalString: null,
        };
    }
}
