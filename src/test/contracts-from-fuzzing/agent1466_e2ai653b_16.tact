struct HasOptionalString {
    s: String?;
    i: Int;
}

contract OptStrTest {
    field: HasOptionalString = HasOptionalString{ s: null, i: 5 };

    init() {
        self.field = HasOptionalString{ s: "foo", i: 10 };
    }
}
