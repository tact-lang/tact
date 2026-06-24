struct SingleOptional {
    value: Int?;
    another: Bool;
}

contract OptionalInStruct {
    data: SingleOptional;

    init() {
        self.data = SingleOptional{
            value: null,
            another: true,
        };
    }
}