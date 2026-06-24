struct Nulled {
    val: Int?;
}

struct DoubleWrap {
    s1: Nulled?;
    s2: Nulled?;
}

contract NullWrap {
    inner: DoubleWrap;
    init() {
        self.inner = DoubleWrap{
            s1: Nulled{val: null},
            s2: null
        };
    }
}