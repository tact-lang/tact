struct OptInner {
    b: Bool;
}

struct OptWrap {
    inner: OptInner?;
}

contract OptInContract {
    f: OptWrap;

    init() {
        self.f = OptWrap{
            inner: OptInner{ b: true }
        };
    }
}