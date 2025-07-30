struct OptionalPrimitives {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    oa: Address?;
}

contract OptionalPrimitiveFields {
    val: OptionalPrimitives;

    init() {
        self.val = OptionalPrimitives{
            oi: null, ob: null, os: null, oc: null, osl: null, oa: null
        };
    }
}