struct SliceStruct {
    data: Slice;
    ok: Bool;
}

contract SliceInStorage {
    sdata: SliceStruct;

    init() {
        self.sdata = SliceStruct{
            data: beginCell().storeUint(1,1).endCell().asSlice(),
            ok: true,
        };
    }
}