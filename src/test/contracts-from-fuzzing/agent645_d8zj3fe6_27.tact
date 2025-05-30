struct OptPrimitives {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    oa: Address?;
}

contract AllOptionals {
    f: OptPrimitives;

    init() {
        self.f = OptPrimitives{
            oi: null,
            ob: null,
            os: null,
            oc: null,
            oa: null,
        };
    }
}
