struct SOpt {
    x: Int?;
}

contract NestedOpt {
    field: SOpt?;

    init() {
        self.field = null;
    }
}