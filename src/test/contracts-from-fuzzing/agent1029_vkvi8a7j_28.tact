struct OptionalSlice {
    sliceData: Slice?;
}

contract OptionalSliceContract {
    opt: OptionalSlice;
    init() {
        self.opt = OptionalSlice{sliceData:null};
    }
}