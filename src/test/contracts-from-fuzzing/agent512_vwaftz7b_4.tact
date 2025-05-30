struct OptionalNest {
    inner: Int?;
    flag: Bool?;
}

contract OptionalDeep {
    field1: OptionalNest?;

    init() {
        self.field1 = OptionalNest{
            inner: 42,
            flag: null,
        };
    }

    receive() {}
}