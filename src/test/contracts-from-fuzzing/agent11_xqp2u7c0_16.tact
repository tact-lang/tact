struct SerializeOptionalCombo {
    a: Int? as uint32;
    b: Bool?;
    c: String?;
}

contract SerializeOptionalTest {
    s: SerializeOptionalCombo;

    init() {
        self.s = SerializeOptionalCombo{
            a: 1000,
            b: null,
            c: "hi"
        };
    }
}