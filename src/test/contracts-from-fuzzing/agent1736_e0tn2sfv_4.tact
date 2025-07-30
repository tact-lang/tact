struct OptionalStruct {
    someInt: Int;
    text: String?;
    flag: Bool?;
}

contract OptInside {
    data: OptionalStruct;
    init() {
        self.data = OptionalStruct{
            someInt: 42,
            text: null,
            flag: true
        };
    }
}