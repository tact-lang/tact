struct OneField { val: Int }
struct TwoField { val1: Int; val2: Int }
struct ThreeField { val1: Int; val2: Int; val3: Int }

struct NestedCombos {
    one: OneField;
    two: TwoField;
    three: ThreeField;
}

contract ManyNestedCombos {
    data: NestedCombos;
    init() {
        self.data = NestedCombos{
            one: OneField{val: 1},
            two: TwoField{val1:2, val2:3},
            three: ThreeField{val1:4, val2:5, val3:6}
        };
    }
}