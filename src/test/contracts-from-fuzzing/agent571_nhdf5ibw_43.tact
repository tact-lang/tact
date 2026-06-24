struct Inner {
    value: Int = 999;
    note: String = "note";
}

struct BigMixedOpts {
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    os: String?;
    osl: Slice?;
    complexOpt: Inner?;
}

contract TestContract {
    data: BigMixedOpts;

    init() {
        self.data = BigMixedOpts{
            oi: null,
            ob: null,
            oa: null,
            oc: null,
            os: null,
            osl: null,
            complexOpt: null
        };
    }
}