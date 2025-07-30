struct MultiLayer {
    inner: Inner;
}

struct Inner {
    val: Int;
    opt: Int?;
}

contract Test {
    f: MultiLayer;
    init() {
        self.f = MultiLayer{
            inner: Inner{ val:10, opt:null }
        };
    }
}