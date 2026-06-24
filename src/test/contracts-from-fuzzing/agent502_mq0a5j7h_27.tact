struct OptionalSliceWrap {
    s: Slice?;
}

contract SliceOptional {
    sw: OptionalSliceWrap;

    init() {
        self.sw = OptionalSliceWrap{
            s: null
        };
    }
}