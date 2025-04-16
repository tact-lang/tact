struct HasRemain {
    payload: Slice as remaining;
}

contract RemainStruct {
    val: HasRemain;
    init() {
        self.val = HasRemain{ payload: "hi".asComment().asSlice() };
    }
}