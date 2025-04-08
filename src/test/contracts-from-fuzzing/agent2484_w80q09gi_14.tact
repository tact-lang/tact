contract AllPrimitiveOptionals {
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    os: String?;
    oc: Cell?;
    osl: Slice?;

    init() {
        self.oi=null;
        self.ob=null;
        self.oa=null;
        self.os=null;
        self.oc=null;
        self.osl=null;
    }
}