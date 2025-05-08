struct InnerRem {
    x: Int;
    rest: Slice as remaining;
}

struct OuterBad {
    prefix: Int;
    y: InnerRem;
    suffix: Int;
}

contract RemBug {
    val: OuterBad;
    init() {
        self.val = OuterBad{
            prefix:1,
            y: InnerRem{ x:2, rest: emptyCell().asSlice() },
            suffix:3
        };
    }
}