struct Wrap {
    inner: Int?;
}

contract OptWrap {
    w: Wrap?;

    init() {
        self.w = null;
    }
}