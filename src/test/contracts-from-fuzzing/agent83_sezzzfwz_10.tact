struct OptionalContainer {
    intOpt: Int?;
    boolOpt: Bool?;
    cellOpt: Cell?;
}

contract OptionalFields {
    container: OptionalContainer?;

    init() {
        self.container = null;
    }
}