struct Deep {
    nested: Nested;
}

struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    num: Int;
    text: String;
}

contract DeepStorage {
    deepField: Deep;

    init() {
        self.deepField = Deep{
            nested: Nested{
                inner: Inner{
                    flag: false,
                    num: 42,
                    text: "hello",
                },
            },
        };
    }
}
