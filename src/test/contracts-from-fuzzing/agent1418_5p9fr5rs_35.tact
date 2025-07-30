struct Rema {
    prefix: Int;
    rest: Slice as remaining;
}

struct Wrap {
    inner: Rema;
}

contract NestedRemaining {
    w: Wrap;

    init() {
        self.w = Wrap{
            inner: Rema{
                prefix: 3,
                rest: emptyCell().asSlice(),
            }
        };
    }
}