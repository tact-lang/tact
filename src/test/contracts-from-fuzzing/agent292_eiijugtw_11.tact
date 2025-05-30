struct OptionalAndBool {
    flag: Bool;
    opt: Int?;
    anotherFlag: Bool;
}

contract MixedOptionalBool {
    data: OptionalAndBool;

    init() {
        self.data = OptionalAndBool{ flag: true, opt: null, anotherFlag: false };
    }
}