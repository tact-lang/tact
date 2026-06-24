struct Deep {
    inner: Outer;
    num: Int;
}

struct Nested {
    x: Int;
    y: Int?;
}

struct Outer {
    nested: Nested;
    flag: Bool;
    text: String;
}

contract TestContract {
    d: Deep;

    init() {
        self.d = Deep {
            inner: Outer {
                nested: Nested { x: 123, y: null },
                flag: false,
                text: "test"
            },
            num: -999
        };
    }
}