struct InnerRem {
    a: Int as uint32;
    tail: Slice as remaining;
}

struct OuterRem {
    leading: Int as uint16;
    mid: InnerRem;
}

contract NestRemaining {
    data: OuterRem;

    init() {
        self.data = OuterRem{
            leading: 99,
            mid: InnerRem{
                a: 42,
                tail: beginCell().storeUint(7,3).endCell().asSlice()
            }
        };
    }
}