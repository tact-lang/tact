struct OptionalSliceWrap {
    sl: Slice?;
}

contract OptionalSliceStruct {
    field: OptionalSliceWrap;

    init() {
        self.field = OptionalSliceWrap{
            sl: null
        };
    }
}
