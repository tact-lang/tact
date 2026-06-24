struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct NestedDeepOptional {
    inner: DeepOptional;
    extra: Int;
}

contract TestDeepOptionals {
    s: NestedDeepOptional;

    init() {
        self.s = NestedDeepOptional{
            inner: DeepOptional{
                a: null,
                b: true,
                c: "hello",
                d: null
            },
            extra: 42
        };
    }
}