struct HasOptionalNested {
    optField: Inner?;
}

struct Inner {
    val: Int;
    text: String;
}

contract OptionalNestedStruct {
    data: HasOptionalNested;

    init() {
        self.data = HasOptionalNested {
            optField: null
        };
    }
}
