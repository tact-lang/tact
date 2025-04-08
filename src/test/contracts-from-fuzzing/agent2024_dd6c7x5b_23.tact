struct SDefault {
    a: Int = 1;
}

contract OptStructWithDef {
    opt: SDefault?;

    init() {
        self.opt = null;
    }
}