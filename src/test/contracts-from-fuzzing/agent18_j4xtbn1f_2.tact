struct Deep {
    inner: Nested;
    optInner: Nested?;
}

struct Nested {
    val1: Int;
    val2: Int?;
}

contract Test {
    d: Deep;

    init() {
        self.d = Deep{
            inner: Nested{val1:1, val2: null},
            optInner: null
        };
    }
}