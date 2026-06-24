struct OptPrims {
    ival: Int?;
    sval: String?;
    bval: Bool?;
}

contract TestContract {
    field: OptPrims;

    init() {
        self.field = OptPrims{ ival: null, sval: null, bval: null };
    }
}
