struct ManyOptionalPrims {
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    os: String?;
}

contract ManyOptionalFields {
    data: ManyOptionalPrims;

    init() {
        self.data = ManyOptionalPrims{ oi: null, ob: null, oa: null, oc: null, os: null };
    }
}