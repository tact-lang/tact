struct OptionalPrimitives {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    oa: Address?;
}

contract OptionalPrimitivesTest {
    data: OptionalPrimitives;

    init() {
        self.data = OptionalPrimitives{
            oi: null,
            ob: null,
            os: null,
            oc: null,
            osl: null,
            oa: null
        };
    }
}