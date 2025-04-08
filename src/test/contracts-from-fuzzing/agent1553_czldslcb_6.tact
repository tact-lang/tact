struct Simple {
    value: Int;
}

contract OptField {
    field: Simple?;

    init() {
        self.field = null;
    }
}