struct DeepCombination {
    num: Int;
    opt_str: String?;
    inner: InnerCombo;
}

struct InnerCombo {
    flag: Bool;
    s: String;
    val_opt: Int?;
}

contract DeepComboContract {
    comb: DeepCombination;

    init() {
        self.comb = DeepCombination{
            num: 123,
            opt_str: null,
            inner: InnerCombo{
                flag: false,
                s: "hello",
                val_opt: null
            }
        };
    }
}