struct HasOptionalSlice {
    slice: Slice?;
}

contract OptSliceContract {
    inner: HasOptionalSlice;
    init(){
        self.inner = HasOptionalSlice{slice: null};
    }
}