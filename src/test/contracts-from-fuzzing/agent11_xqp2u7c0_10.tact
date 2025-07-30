struct LargeNestedCombo {
    outerInt: Int;
    outerBool: Bool;
    nestedOne: InnerCombo;
    nestedTwo: InnerCombo;
}

struct InnerCombo {
    valInt: Int;
    valBool: Bool;
    optVal: Int?;
    defVal: Bool = false;
}

contract ComboTest {
    combo: LargeNestedCombo;

    init() {
        self.combo = LargeNestedCombo{
            outerInt: 7,
            outerBool: true,
            nestedOne: InnerCombo{
                valInt: 1,
                valBool: false,
                optVal: null
            },
            nestedTwo: InnerCombo{
                valInt: 2,
                valBool: true,
                optVal: 123,
                defVal: true
            }
        };
    }
}