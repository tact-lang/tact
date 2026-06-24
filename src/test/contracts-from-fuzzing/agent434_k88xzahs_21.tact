struct NestedRemain {
    prefix: Int as uint4;
    rest: Slice as remaining;
}

struct Top {
    nested: NestedRemain;
    flag: Bool;
}

contract TestContract {
    storage: Top;

    init() {
        self.storage = Top{
            nested: NestedRemain{ prefix: 4, rest: emptyCell().asSlice() },
            flag: false
        };
    }
}