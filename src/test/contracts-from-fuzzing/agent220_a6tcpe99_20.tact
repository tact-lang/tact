struct SliceStruct {
    prefix: Int as uint8;
    suffix: Slice as remaining;
}

contract TailSlicePersist {
    storeme: SliceStruct;

    init() {
        self.storeme = SliceStruct{
            prefix: 42,
            suffix: emptyCell().asSlice()
        };
    }

    receive() {}
}