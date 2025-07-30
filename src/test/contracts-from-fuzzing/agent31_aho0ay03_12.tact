struct Wrap {
    w: Int?;
}

struct OutWrap {
    inner: Wrap?;
}

contract TestContract {
    data: OutWrap?;

    init() {
        self.data = null;
    }
}
