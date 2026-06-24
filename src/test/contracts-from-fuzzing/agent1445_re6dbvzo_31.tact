struct WeirdCombo {
    intVal: Int;
    strOpt: String?;
    boolVal: Bool;
}

contract WeirdTest {
    data: WeirdCombo?;

    init() {
        self.data = WeirdCombo{
            intVal: 123,
            strOpt: null,
            boolVal: true,
        };
    }
}