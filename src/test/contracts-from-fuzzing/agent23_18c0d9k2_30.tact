struct S {
    a: Int;
}

contract InsideOptStruct {
    opt: S?;

    init() {
        self.opt = null;
    }
}