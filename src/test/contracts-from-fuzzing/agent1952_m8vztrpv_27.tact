struct TailNested {
    prefix: Int;
    nested: TailStruct;
}

struct TailStruct {
    start: Int;
    tail: Slice as remaining;
}

contract TestContract {
    tn: TailNested;

    init() {
        self.tn = TailNested{
            prefix: 1,
            nested: TailStruct{
                start: 2,
                tail: emptyCell().asSlice(),
            },
        };
    }
}
