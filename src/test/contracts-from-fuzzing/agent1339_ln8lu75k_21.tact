struct OptionInMiddle {
    a: Int;
    b: Int?;
    c: String;
}

contract OptionalMidField {
    val: OptionInMiddle;

    init() {
        self.val = OptionInMiddle{
            a: 1,
            b: null,
            c: "end"
        };
    }
}