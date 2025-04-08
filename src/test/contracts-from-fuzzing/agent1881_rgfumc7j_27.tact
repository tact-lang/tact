struct AllOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptComboTest {
    d: AllOptionals;

    init() {
        self.d = AllOptionals{ a: null, b: null, c: null };
    }
}