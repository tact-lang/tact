struct OptionalField {
    maybeVal: Int?;
    num: Int;
}

contract OptionStructContract {
    opt: OptionalField;

    init() {
        self.opt = OptionalField{
            maybeVal: null,
            num: 42
        };
    }
}