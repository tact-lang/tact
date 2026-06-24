struct OptionalStruct {
    value: Int;
}

struct ContainsOptional {
    maybeStruct: OptionalStruct?;
    flag: Bool;
}

contract OptionalInStruct {
    data: ContainsOptional;

    init() {
        self.data = ContainsOptional{
            maybeStruct: null,
            flag: true,
        };
    }
}
