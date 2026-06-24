struct ContainsOptional {
    optField: Int?;
    other: Bool;
}

contract OptionalInStruct {
    data: ContainsOptional;

    init() {
        self.data = ContainsOptional{
            optField: null,
            other: false
        };
    }
}