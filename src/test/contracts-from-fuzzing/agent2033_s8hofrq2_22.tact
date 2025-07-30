struct NestedRemain {
    nested: RemainderStruct;
    suffix: Int;
}

struct RemainderStruct {
    prefix: Int as uint64;
    tail: Slice as remaining;
}

contract Test {
    val: NestedRemain;

    init() {
        self.val = NestedRemain{
            nested: RemainderStruct{
                prefix: 999,
                tail: emptyCell().asSlice()
            },
            suffix: 1
        };
    }
}