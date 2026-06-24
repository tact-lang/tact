struct DeepInner {
    a: Int;
    b: Bool?;
}

struct Inner {
    i: Int;
    deep: DeepInner;
}

struct Outer {
    s: String;
    nested: Inner;
    flag: Bool;
}

contract TestFields {
    info: Outer;

    init() {
        self.info = Outer{
            s: "Hi",
            nested: Inner{
                i: 5,
                deep: DeepInner{ a: 10, b: null },
            },
            flag: true,
        };
    }
}
