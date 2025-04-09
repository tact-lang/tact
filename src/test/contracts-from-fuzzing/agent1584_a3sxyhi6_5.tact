struct OptStruct {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    oc: Cell?;
    osl: Slice?;
    obld: Builder?;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            oi: null,
            ob: null,
            os: null,
            oa: null,
            oc: null,
            osl: null,
            obld: null
        };
    }
}