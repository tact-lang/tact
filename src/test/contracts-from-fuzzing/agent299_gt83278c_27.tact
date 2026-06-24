struct RemainStruct {
    count: Int;
    data: Slice as remaining;
}

contract TestContract {
    rec: RemainStruct;

    init() {
        self.rec = RemainStruct{
            count: 42,
            data: emptyCell().asSlice()
        };
    }
}