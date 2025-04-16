struct Inner {
    b: Bool;
}

struct Middle {
    s: String;
    inner: Inner?;
}

contract OptionalNestedStruct {
    data: Middle?;

    init() {
        self.data = Middle{
            s: "ok",
            inner: Inner{
                b: true,
            },
        };
    }
}