struct RemainderStruct {
    count: Int as uint4;
    rest: Slice as remaining;
}

contract TestContract {
    data: RemainderStruct;

    init() {
        self.data = RemainderStruct{
            count: 5,
            rest: emptyCell().asSlice(),
        };
    }
}