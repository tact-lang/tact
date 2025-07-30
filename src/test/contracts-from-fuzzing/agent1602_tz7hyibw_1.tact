struct ManyOptionalFields {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;
    f5: Cell?;
}

contract OptionalFieldsTest {
    s: ManyOptionalFields;

    init() {
        self.s = ManyOptionalFields{
            f1: 1,
            f2: true,
            f3: "hi",
            f4: myAddress(),
            f5: emptyCell(),
        };
    }
}
