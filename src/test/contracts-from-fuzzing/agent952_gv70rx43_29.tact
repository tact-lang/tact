struct X {
    a: Int?;
}

contract NullAssign {
    field: X?;

    init() {
        self.field = null;
    }
}
