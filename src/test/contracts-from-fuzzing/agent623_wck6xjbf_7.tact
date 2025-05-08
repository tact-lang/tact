struct OptionalStruct {
    val: Int?;
    str: String?;
    flag: Bool?;
}

contract OptionalInStruct {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            val: null,
            str: null,
            flag: true,
        };
    }
}