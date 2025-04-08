struct SOpt {
    a: Int?;
    b: Bool?;
}

contract StructOptInOpt {
    field: SOpt?;

    init() {
        self.field = null;
    }
}