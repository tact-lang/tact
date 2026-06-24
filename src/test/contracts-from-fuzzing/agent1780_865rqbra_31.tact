struct HasRemain {
    prefix: Int as uint32;
    rest: Slice as remaining;
}

struct OptionalHasRemain {
    inner: HasRemain?;
}

contract OptionalInnerRem {
    data: OptionalHasRemain;

    init() {
        self.data = OptionalHasRemain{
            inner: HasRemain{
                prefix: 99,
                rest: emptyCell().asSlice()
            }
        };
    }
}