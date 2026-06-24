struct TailStruct {
    num: Int as uint8;
    extra: Slice as remaining;
}

contract TestOptTail {
    s: TailStruct? = null;

    init() {
        self.s = TailStruct{
            num: 42,
            extra: emptyCell().asSlice()
        };
    }
}