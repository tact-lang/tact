struct InnerStruct {
    bflag: Bool;
    number: Int;
    optionalVal: Int?;
}

contract TestContract {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            bflag: true,
            number: 10,
            optionalVal: null,
        };
    }
}