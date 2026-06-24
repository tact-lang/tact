struct OptStruct {
    val: Int?;
    flag: Bool?;
    addr: Address?;
}

contract OptionalFields {
    os: OptStruct;

    init() {
        self.os = OptStruct{
            val: null,
            flag: null,
            addr: null,
        };
    }
}