struct OptStringStruct {
    s1: String?;
    s2: String?;
}

contract OptionalStrings {
    data: OptStringStruct;

    init() {
        self.data = OptStringStruct{
            s1: null,
            s2: null
        };
    }
}
