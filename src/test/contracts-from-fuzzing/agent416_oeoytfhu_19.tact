struct OptionalFields {
    intOpt: Int?;
    boolOpt: Bool?;
}

contract Test19 {
    nestedOpt: OptionalFields?;

    init() {
        self.nestedOpt = null;
    }
}
