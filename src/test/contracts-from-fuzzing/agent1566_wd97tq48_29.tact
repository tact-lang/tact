struct SliceOptStruct {
    s: Slice?;
}

contract SliceOptTop {
    s: SliceOptStruct;

    init() {
        self.s = SliceOptStruct{ s:null };
    }
}
