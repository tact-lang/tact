struct Inner {
    val: Int;
}

struct Wrapper {
    optInner: Inner?;
}

contract Test {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            optInner: Inner{ val: 7 }
        };
    }
}