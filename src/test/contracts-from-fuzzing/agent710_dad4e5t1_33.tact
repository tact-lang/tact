struct ExplicitZero {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract ZeroTest {
    field: ExplicitZero = ExplicitZero{};

    init() {
        self.field = ExplicitZero{ a: 7, b: true, c: "abc" };
    }
}