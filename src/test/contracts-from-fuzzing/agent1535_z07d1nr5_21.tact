struct BottomOpt {
    x: Int;
}

struct MiddleOpt {
    inner: BottomOpt?;
}

contract OptWithinOptPersist {
    storage: MiddleOpt? = null;
    init() {
        self.storage = MiddleOpt{
            inner: BottomOpt{ x: 5 },
        };
    }
}
