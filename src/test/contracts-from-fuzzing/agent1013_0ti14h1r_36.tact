struct SOptDef {
    a:Int?=null;
    b:Bool?=null;
}

contract OptDefaults {
    f:SOptDef;

    init() {
        self.f = SOptDef{};
    }
}
