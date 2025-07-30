struct Def {
    f:Int=1;
}

contract OptDef {
    d: Def?;
    init() {
        self.d = null;
    }
}