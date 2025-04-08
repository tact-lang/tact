struct SliceOpt {
    maybeSlice: Slice?;
}

contract SliceOptTest {
    data: SliceOpt;

    init() {
        self.data = SliceOpt{
            maybeSlice: null
        };
    }
}