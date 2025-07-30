struct PrimitiveOptionals {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    oc: Cell?;
    osl: Slice?;
}

contract OptionalsVariety {
    data: PrimitiveOptionals;

    init() {
        self.data = PrimitiveOptionals{
            oi: null,
            ob: null,
            os: null,
            oa: null,
            oc: null,
            osl: null
        };
    }
}