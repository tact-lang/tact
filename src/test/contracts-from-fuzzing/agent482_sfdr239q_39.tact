struct RemainStruct {
    x: Int;
    rem: Slice as remaining;
}

contract RemainSerialization {
    val: RemainStruct;

    init() {
        self.val = RemainStruct{
            x: 10,
            rem: emptyCell().asSlice()
        };
    }
}
