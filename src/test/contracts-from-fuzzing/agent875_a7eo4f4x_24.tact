struct NestedCombo {
    first: FirstLayer;
}

struct FirstLayer {
    optSecond: SecondLayer?;
}

struct SecondLayer {
    val: Int;
    optText: String?;
}

contract NestedComboContract {
    data: NestedCombo;

    init() {
        self.data = NestedCombo{
            first: FirstLayer{
                optSecond: SecondLayer{
                    val:123,
                    optText:null
                }
            }
        };
    }
}