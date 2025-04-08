struct SlicesOpt {
    s1: Slice?;
    s2: Slice;
}

contract MoreSliceStruct {
    val: SlicesOpt;
    init() {
        self.val = SlicesOpt{s1:null,s2:emptyCell().asSlice()};
    }
}