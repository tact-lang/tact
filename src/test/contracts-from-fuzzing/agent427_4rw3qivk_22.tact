struct StructBoolCombo {
    one: Bool;
    two: Bool;
    three: Bool;
    four: Bool;
    five: Bool;
    six: Bool;
    seven: Bool;
    eight: Bool;
    nine: Bool;
    ten: Bool;
}

contract ManyBools {
    bb: StructBoolCombo;

    init() {
        self.bb = StructBoolCombo{
            one:true, two:false, three:true, four:false, five:true,
            six:true, seven:false, eight:true, nine:false, ten:true
        };
    }
}