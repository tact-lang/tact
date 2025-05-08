struct Inner {
    val: Int;
    opt: Int?;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

contract Test {
    data: Middle;
    init() {
        self.data = Middle{
            inner1: Inner{ val:1, opt:null },
            inner2: Inner{ val:2, opt:null }
        };
    }
}