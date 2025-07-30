struct Opts {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
}

contract TestContract {
    data: Opts;

    init() {
        self.data = Opts{
            oi: null,
            ob: null,
            os: null,
            oc: null,
            osl: null
        };
    }
}