struct NestedDefaults {
    inner: InnerDefaults;
}

struct InnerDefaults {
    foo: Int = 1;
    bar: String = "hi";
    baz: Bool = false;
}

contract DefaultInNested {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            inner: InnerDefaults{
                foo: 5,
                bar: "yo",
                baz: true,
            },
        };
    }
}