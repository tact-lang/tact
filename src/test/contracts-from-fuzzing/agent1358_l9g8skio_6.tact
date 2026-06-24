struct Opts {
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    os: String?;
}

contract Test {
    data: Opts;

    init() {
        self.data = Opts {
            oi: 1,
            ob: null,
            oa: null,
            oc: null,
            os: "hi",
        };
    }
}