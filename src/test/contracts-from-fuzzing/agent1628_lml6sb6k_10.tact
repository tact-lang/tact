struct OptionalStruct {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
    maybeStruct: InnerOptional?;
}

struct InnerOptional {
    foo: Int;
    bar: Bool;
}

contract OptionalFieldsContract {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{
            maybeInt: null,
            maybeBool: null,
            maybeString: null,
            maybeStruct: null
        };
    }
}