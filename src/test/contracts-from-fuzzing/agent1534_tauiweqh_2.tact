struct Nested {
    x: Int;
    y: Bool?;
    z: String;
}

struct Outer {
    inner: Nested;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Nested{
                x: 42,
                y: null,
                z: "test",
            },
            flag: true,
        };
    }
}