struct DeepNested {
    inner: Nested;
    flag: Bool;
}

struct Nested {
    a: Int;
    b: Bool?;
    c: String;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: Nested{
                a: 1,
                b: null,
                c: "hi",
            },
            flag: true,
        };
    }
}