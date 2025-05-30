struct BoolOptionalFields {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
    b6: Bool?;
}

contract TestContract {
    bf: BoolOptionalFields;

    init() {
        self.bf = BoolOptionalFields{
            b1: null,
            b2: true,
            b3: false,
            b4: null,
            b5: true,
            b6: false,
        };
    }
}
