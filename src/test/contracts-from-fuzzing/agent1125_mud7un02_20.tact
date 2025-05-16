struct InnerMost {
    val: Int;
}

struct Middle {
    optInner: InnerMost?;
}

contract TestContract {
    mid: Middle;

    init() {
        self.mid = Middle{
            optInner: null,
        };
    }
}