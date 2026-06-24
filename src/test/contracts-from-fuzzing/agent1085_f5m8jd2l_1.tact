struct DeepInner {
    a: Int?;
    b: String;
}

struct Middle {
    inner: DeepInner;
    flag: Bool?;
}

contract DeepNestedFields {
    nested: Middle;

    init() {
        self.nested = Middle{
            inner: DeepInner{
                a: 123,
                b: "hello"
            },
            flag: true
        };
    }
}