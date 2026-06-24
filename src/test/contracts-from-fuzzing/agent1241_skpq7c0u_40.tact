struct HasRemOpt {
    a: Int;
    rest: Slice as remaining;
}

struct RemTwiceNest {
    first: HasRemOpt;
    second: HasRemOpt;
}

contract RemTwiceWrap {
    wrap: RemTwiceNest;

    init() {
        self.wrap = RemTwiceNest{
            first: HasRemOpt{
                a: 111,
                rest: emptyCell().asSlice(),
            },
            second: HasRemOpt{
                a: 222,
                rest: emptyCell().asSlice(),
            },
        };
    }
}
