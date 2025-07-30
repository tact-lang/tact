struct InnerMost {
    val: Int;
    f: Bool?
}

struct Middle {
    inner: InnerMost?;
}

struct Top {
    mid1: Middle;
    mid2: Middle?;
    flag: Bool;
}

contract NestedNulls {
    d: Top;

    init() {
        self.d = Top{
            mid1: Middle{inner: null},
            mid2: null,
            flag: true
        };
    }
}