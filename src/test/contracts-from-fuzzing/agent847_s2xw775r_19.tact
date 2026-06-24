struct RemainTest {
    field1: Int;
    payload: Slice as remaining;
}

contract RemainingFieldStruct {
    data: RemainTest;

    init() {
        self.data = RemainTest{
            field1: 5,
            payload: emptyCell().asSlice()
        };
    }
}