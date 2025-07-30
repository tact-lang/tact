struct NestedOptionalInside {
    x: Int?;
}

struct NestedOptionalMid {
    inner: NestedOptionalInside?;
}

struct NestedOptionalTop {
    mid: NestedOptionalMid?;
}

contract NestedOptStructWrap {
    big: NestedOptionalTop;

    init() {
        self.big = NestedOptionalTop{
            mid: null
        };
    }
}