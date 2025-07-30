struct Inner {
    x: Int;
    y: Int?;
    z: Bool?;
}

struct Outer {
    inner: Inner;
    label: String;
}

contract NestedStructContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 10,
                y: null,
                z: true,
            },
            label: "Nested",
        };
    }
}
