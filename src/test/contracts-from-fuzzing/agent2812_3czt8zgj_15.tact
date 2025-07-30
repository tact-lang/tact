struct OptDefaultCombo {
    a: Int?;
    b: Bool?;
    c: String = "test";
    d: Int = 5;
}

contract ComboTest {
    data: OptDefaultCombo;

    init() {
        self.data = OptDefaultCombo{
            a: null,
            b: true
        };
    }
}