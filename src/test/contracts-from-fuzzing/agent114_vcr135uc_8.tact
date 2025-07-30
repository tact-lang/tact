struct SubLeaf {
    prefix: Int as uint8;
    suffix: Slice as remaining;
}

struct Leaf {
    data: Int?;
    extra: String?;
    tail: SubLeaf;
}

struct Middle {
    left: Leaf?;
    right: Leaf?;
    flag: Bool;
}

contract NestedRemainder {
    storage: Middle;

    init() {
        self.storage = Middle{
            left: Leaf{
                data: 1,
                extra: "extra",
                tail: SubLeaf{
                    prefix: 255,
                    suffix: beginCell().storeUint(0,1).endCell().asSlice()
                }
            },
            right: null,
            flag: true,
        };
    }
}
