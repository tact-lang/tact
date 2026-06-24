struct HasOptionalStruct {
    maybeStr: String?;
    maybeCell: Cell?;
    maybeSlice: Slice?;
}

contract OptionalPrimitives {
    s: HasOptionalStruct;

    init() {
        self.s = HasOptionalStruct{
            maybeStr: null,
            maybeCell: null,
            maybeSlice: null
        };
    }
}