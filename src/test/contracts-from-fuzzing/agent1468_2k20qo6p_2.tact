struct OptNested {
    field1: Int;
    field2: Bool?;
    field3: String?;
}

contract TestOpt {
    data: OptNested;

    init() {
        self.data = OptNested{
            field1: 0,
            field2: null,
            field3: null,
        };
    }
}
