struct SomeStruct {
    a: Int;
}

contract OptStructUnsetInner {
    opt: SomeStruct?;
    init() {
        self.opt = null;
    }
}