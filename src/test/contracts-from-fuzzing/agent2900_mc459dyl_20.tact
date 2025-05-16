struct ManyOptionals {
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract ContractOpts {
    f: ManyOptionals;

    init() {
        self.f = ManyOptionals{
            oi: null,
            ob: null,
            os: null,
        };
    }
}
