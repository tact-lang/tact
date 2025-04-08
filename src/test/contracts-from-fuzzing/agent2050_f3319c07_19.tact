struct RemainingStruct {
    x: Int;
    y: Slice as remaining;
}

contract RemTest {
    data: RemainingStruct;

    init() {
        self.data = RemainingStruct{
            x: 123,
            y: emptyCell().asSlice()
        };
    }
}