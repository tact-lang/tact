struct RemainStruct {
    flag: Bool;
    data: Slice as remaining;
}

contract PersistRemain {
    rs: RemainStruct;

    init() {
        self.rs = RemainStruct{
            flag: true,
            data: emptyCell().asSlice()
        };
    }
}
