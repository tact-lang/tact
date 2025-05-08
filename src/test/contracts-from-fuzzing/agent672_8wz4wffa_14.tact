struct DeepOptional {
    maybeInt: Int?;
    maybeSlice: Slice?;
    maybeCell: Cell?;
    maybeAddr: Address?;
    maybeBool: Bool?;
}

contract OptionalFields {
    opts: DeepOptional;

    init() {
        self.opts = DeepOptional{
            maybeInt: null,
            maybeSlice: null,
            maybeCell: null,
            maybeAddr: null,
            maybeBool: null
        };
    }
}