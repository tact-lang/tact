struct OptionalInStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestOptional {
    opt: OptionalInStruct;

    init() {
        self.opt = OptionalInStruct{
            a: 5,
            b: null,
            c: null
        };
    }
}