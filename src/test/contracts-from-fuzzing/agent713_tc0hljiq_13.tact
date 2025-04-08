struct OptionalInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructs {
    optStruct: OptionalInStruct?;
    init() {
        self.optStruct = OptionalInStruct{
            a: null,
            b: null,
            c: null
        };
    }
}