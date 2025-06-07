struct Nested {
    inner: InnerOption;
    value: Int;
}

struct InnerOption {
    x: Int?;
    y: Bool?;
}

contract TestDeep {
    n: Nested;

    init() {
        self.n = Nested{
            inner: InnerOption{x: null, y: true},
            value: -42
        };
    }
}