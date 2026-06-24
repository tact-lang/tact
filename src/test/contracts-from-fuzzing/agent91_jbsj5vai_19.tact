struct SliceStruct {
    s: Slice;
    flag: Bool;
}

contract SliceFieldContract {
    x: SliceStruct;

    init() {
        let c = emptyCell();
        self.x = SliceStruct{
            s: c.asSlice(),
            flag: true
        };
    }
}
