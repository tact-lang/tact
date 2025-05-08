struct RemainderStruct {
    x: Int;
    y: Slice as remaining;
}

contract Test {
    data: RemainderStruct;

    init() {
        self.data = RemainderStruct{
            x: 5,
            y: emptyCell().asSlice()
        };
    }
}