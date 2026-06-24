struct RemainStruct {
    number: Int as uint32;
    data: Slice as remaining;
}

contract RemainingSliceTest {
    payload: RemainStruct;

    init() {
        self.payload = RemainStruct{
            number: 17,
            data: emptyCell().asSlice()
        };
    }
}