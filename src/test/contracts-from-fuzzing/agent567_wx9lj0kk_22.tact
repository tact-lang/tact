// deeply nested optional with a default (should be null by default)
struct VeryDeep {
    inner: Int?;
}

struct MiddleWrap {
    deep: VeryDeep?;
}

contract NullsInside {
    middle: MiddleWrap?;
    init() {
        self.middle = null;
    }
}
