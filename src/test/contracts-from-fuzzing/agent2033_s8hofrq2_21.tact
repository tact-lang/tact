struct RemainderStruct {
    prefix: Int as uint32;
    tail: Slice as remaining;
}

contract Test {
    s: RemainderStruct;
    
    init() {
        self.s = RemainderStruct{
            prefix: 12345,
            tail: emptyCell().asSlice()
        };
    }
}