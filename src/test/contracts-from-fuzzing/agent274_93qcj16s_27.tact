struct SliceInStruct {
    payload: Slice;
}

contract SliceInsideTest {
    pay: SliceInStruct;

    init() {
        self.pay = SliceInStruct{
            payload: emptyCell().asSlice(),
        };
    }
}