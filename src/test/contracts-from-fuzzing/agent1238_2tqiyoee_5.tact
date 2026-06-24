struct AllOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract AllOptionalFieldsTest {
    opt: AllOptionals;

    init() {
        self.opt = AllOptionals{
            a: null,
            b: null,
            c: true
        };
    }
}