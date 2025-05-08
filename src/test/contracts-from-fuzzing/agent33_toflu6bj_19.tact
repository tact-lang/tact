struct TailStruct {
    a: Int as int32;
    s: Slice as remaining;
}

contract TestContract {
    val: TailStruct;

    init() {
        self.val = TailStruct{
            a: 100,
            s: emptyCell().asSlice()
        };
    }
}