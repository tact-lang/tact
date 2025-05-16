struct IntsAndStr {
    num1: Int as int16;
    num2: Int as uint8;
    s: String;
}

contract MixedSerialize {
    field: IntsAndStr;

    init() {
        self.field = IntsAndStr{
            num1: -5,
            num2: 250,
            s: "test"
        };
    }
}