struct OptionalStruct {
    text: String;
    number: Int?;
}

contract OptionalInStruct {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{ text: "hi", number: null };
    }
}