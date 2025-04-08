struct InnerWrap {
    val: Int?;
}

contract OptionalStructStruct {
    field: InnerWrap?;

    init() {
        self.field = InnerWrap{ val: 5 };
    }
}