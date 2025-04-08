struct OptNested {
    foo: Int?;
    bar: Bool?;
}

struct Holder {
    inner: OptNested?;
    tag: String;
}

contract OptionalNestedStruct {
    data: Holder;

    init() {
        self.data = Holder{
            inner: null,
            tag: "optional nested"
        };
    }
}