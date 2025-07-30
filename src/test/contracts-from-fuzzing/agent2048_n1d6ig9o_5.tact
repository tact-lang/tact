struct Combo1 {
    flag: Bool;
    text: String;
}

struct Combo2 {
    number: Int;
    optCombo1: Combo1?;
}

contract TestOptionalStructField {
    data: Combo2;
    init() {
        self.data = Combo2{
            number: 77,
            optCombo1: Combo1{
                flag: false,
                text: "opt struct",
            }
        };
    }
}
