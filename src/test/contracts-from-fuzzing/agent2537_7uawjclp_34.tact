struct OptionalWrap {
    maybeFlag: Bool?;
}

struct NestedOptionalWrap {
    inner: OptionalWrap;
}

contract NestOptStore {
    data: NestedOptionalWrap;
    init() {
        self.data = NestedOptionalWrap{
            inner: OptionalWrap{ maybeFlag: null }
        };
    }
}