struct MassOptionals {
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    os: String?;
    osl: Slice?;
}

contract TestContract {
    opts: MassOptionals;

    init() {
        self.opts = MassOptionals{
            oi: null,
            ob: null,
            oa: null,
            oc: null,
            os: null,
            osl: null
        };
    }
}