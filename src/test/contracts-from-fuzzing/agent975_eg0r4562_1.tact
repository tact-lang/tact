struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    label: String;
    number: Int as uint32;
    opt_str: String?;
}

contract DeepNested {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{
                flag: true,
                label: "hello",
                number: 123,
                opt_str: null,
            }
        };
    }
}