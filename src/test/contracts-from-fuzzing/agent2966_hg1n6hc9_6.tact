struct OptionalNested {
    inner: InnerOption?;
}

struct InnerOption {
    flag: Bool;
    str: String;
}

contract OptionalDeep {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            inner: InnerOption{
                flag: true,
                str: "hello",
            }
        };
    }
}
