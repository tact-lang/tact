struct RecInner {
    subval: Int;
}

struct RecOuter {
    inner: RecInner;
}

contract RecursionTest {
    optOuter: RecOuter?;

    init() {
        self.optOuter = null;
    }
}
