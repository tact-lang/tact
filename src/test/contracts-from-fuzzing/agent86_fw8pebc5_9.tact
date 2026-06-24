struct OptionalStruct {
    inside: Int?;
    text: String?;
    flag: Bool?;
}

contract TestContract {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            inside: null,
            text: null,
            flag: null,
        };
    }
}