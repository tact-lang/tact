struct OptField {
    foo: Int?;
}

contract OptOverwrite {
    data: OptField;

    init() {
        self.data = OptField{ foo: 5 };
        self.data = OptField{ foo: null };
    }
}
