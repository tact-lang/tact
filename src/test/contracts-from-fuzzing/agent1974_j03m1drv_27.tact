struct OptWrap {
    x: Int?;
    y: Bool;
}

contract DirectOpts {
    f1: OptWrap?;
    f2: OptWrap?;

    init() {
        self.f1 = null;
        self.f2 = OptWrap{ x:null, y:true };
    }
}
