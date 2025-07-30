struct InnerNested {
    y: Int;
    flag: Bool?;
}

struct Nested {
    x: Int;
    inner: InnerNested;
}

contract NestedStructContract {
    data: Nested;

    init() {
        self.data = Nested{
            x: 7,
            inner: InnerNested{
                y: 3,
                flag: null,
            },
        };
    }
}