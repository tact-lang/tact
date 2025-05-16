struct Inner {
    i: Int;
    s: String;
}

struct WrapOptional {
    inner: Inner?;
}

contract OptionalNestedStruct {
    item: WrapOptional;

    init() {
        self.item = WrapOptional{
            inner: null,
        };
    }
}
