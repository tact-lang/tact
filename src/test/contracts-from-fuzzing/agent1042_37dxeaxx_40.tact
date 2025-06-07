struct HasSliceOpt {
    optS: Slice?;
}

contract SliceOptStruct {
    data: HasSliceOpt;
    init() {
        self.data = HasSliceOpt{optS:null};
    }
}