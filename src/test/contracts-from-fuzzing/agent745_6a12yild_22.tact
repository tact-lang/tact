struct SliceStruct {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract SliceInStorage {
    ss: SliceStruct;

    init() {
        let emptyS = emptyCell().asSlice();
        self.ss = SliceStruct{
            s1: emptyS,
            s2: emptyS,
            s3: emptyS
        };
    }
}