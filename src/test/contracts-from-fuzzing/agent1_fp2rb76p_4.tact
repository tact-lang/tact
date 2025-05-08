struct OptionalStruct {
    z: Int?;
    b: Bool?;
    addr: Address?;
    str: String?;
}

contract TestContract {
    opt: OptionalStruct = OptionalStruct{
        z: null,
        b: null,
        addr: null,
        str: null
    };
    init() {}
}