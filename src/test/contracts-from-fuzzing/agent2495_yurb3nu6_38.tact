struct SomeInner {
    a: Int;
    b: Bool;
}

contract OptWholeStruct {
    s: SomeInner?;

    init() {
        self.s = null;
    }
}