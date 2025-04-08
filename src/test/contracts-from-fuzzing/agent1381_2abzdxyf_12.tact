struct RemainStruct {
    a: Int;
    b: Slice as remaining;
}

contract TestContract {
    data: RemainStruct;

    init() {
        self.data = RemainStruct{
            a: 123,
            b: emptyCell().asSlice()
        };
    }
}