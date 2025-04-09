struct BoolIntCombo {
  flag: Bool;
  value: Int;
  optFlag: Bool?;
  optValue: Int?;
}

contract ComboTest {
    data: BoolIntCombo;
    init() {
        self.data = BoolIntCombo{
            flag: true,
            value: 42,
            optFlag: null,
            optValue: null
        };
    }
}
