struct HasBool {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract BoolPackedTest {
    field: HasBool = HasBool{ a: true, b: false, c: true };

    init() {
        self.field = HasBool{ a: false, b: true, c: false };
    }
}
