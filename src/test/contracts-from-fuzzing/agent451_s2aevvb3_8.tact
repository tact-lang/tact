struct Basic {
    x: Int;
}

contract OptionalStructAsField {
    field: Basic?;

    init() {
        self.field = null;
    }
}