struct BoolFields {
    b1: Bool;
    b2: Bool;
    b3: Bool;
}

contract BoolFieldsTest {
    data: BoolFields;

    init() {
        self.data = BoolFields{
            b1: true,
            b2: false,
            b3: true
        };
    }
}