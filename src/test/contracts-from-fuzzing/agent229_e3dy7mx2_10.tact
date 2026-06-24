struct NestedOptionalWrap {
    inner: Int?;
}

contract OptionalStructFieldOptional {
    optField: NestedOptionalWrap?;
    
    init() {
        self.optField = NestedOptionalWrap{
            inner: 999
        };
    }
}
