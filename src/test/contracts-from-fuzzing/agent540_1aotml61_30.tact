struct SRem {
    num: Int as uint8;
    rest: Slice as remaining;
}

struct Outer {
    prefix: Int;
    inner: SRem;
}

contract PartialRemaining {
    val: Outer;

    init() {
        self.val = Outer{
            prefix: 5,
            inner: SRem{ num: 7, rest: emptyCell().asSlice() }
        };
    }
}