struct Inner {
    z: Int;
    flag: Bool;
}

contract Test2 {
    optInner: Inner?;
    init() {
        self.optInner = null;
    }
}