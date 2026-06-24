struct OptionalStruct {
    val: Int?;
    addr: Address?;
    str: String?;
    flag: Bool?;
}

contract OptionalFields {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            val: null,
            addr: null,
            str: null,
            flag: null
        };
    }
}