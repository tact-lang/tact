struct Innermost {
    x: Int;
}
struct InnerWrap {
    inner: Innermost?;
}
contract OptionalInnerStruct {
    field: InnerWrap;
    init() {
        self.field = InnerWrap{inner: null};
    }
}