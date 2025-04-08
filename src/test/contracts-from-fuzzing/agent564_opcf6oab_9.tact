struct InnerMost {
    f: Int;
}

struct Middle {
    mval: Int;
    nested: InnerMost?;
}

struct Top {
    tval: Int;
    mid: Middle;
}

contract NestedUnsetOptionals {
    s: Top;

    init() {
        self.s = Top{
            tval: 10,
            mid: Middle{
                mval: 20
                // omit nested optional
            }
        };
    }
}
