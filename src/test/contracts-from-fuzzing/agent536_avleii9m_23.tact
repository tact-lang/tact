struct TailStruct {
    header: Int;
    data: Slice as remaining;
}

contract StructWithTail {
    st: TailStruct;

    init() {
        self.st = TailStruct{header:1, data:emptyCell().asSlice()};
    }
}