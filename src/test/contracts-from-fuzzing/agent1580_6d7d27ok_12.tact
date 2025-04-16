struct MultiOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract ContractOptFields {
    optStruct: MultiOptionals?;

    init() {
        self.optStruct = null;
    }
}