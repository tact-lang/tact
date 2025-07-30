struct OptionalWrap {
    nested: Inner?;
}

struct Inner {
    flag: Bool;
    text: String?;
}

contract TestContract {
    field: OptionalWrap;

    init() {
        self.field = OptionalWrap{
            nested: Inner{
                flag: true,
                text: null,
            },
        };
    }
}
