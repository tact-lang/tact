struct SOpt {
    oi: Int?;
    ob: Bool?;
    oa: Address?;
}

contract WrapOpt {
    f: SOpt?;

    init() {
        self.f = SOpt{
            oi: null,
            ob: null,
            oa: null
        };
    }
}
