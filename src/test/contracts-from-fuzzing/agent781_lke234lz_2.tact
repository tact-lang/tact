struct Levels3 {
    l1: Int = 1;
    l2: Bool = false;
}

struct Levels2 {
    midVal: Int = 10;
    nested: Levels3;
    optNested: Levels3?;
}

struct Levels1 {
    topVal: Int = 100;
    inner: Levels2;
    optInner: Levels2?;
}

contract OptionalDeepNesting {
    val: Levels1;

    init() {
        self.val = Levels1{
            topVal: 555,
            inner: Levels2{
                midVal: 777,
                nested: Levels3{ l1: 11, l2: true },
                optNested: null,
            },
            optInner: null,
        };
    }
}