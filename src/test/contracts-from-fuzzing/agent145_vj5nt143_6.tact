struct OptionalStruct {
    val: Int?;
    flag: Bool?;
    text: String?;
}

contract OptionalFields {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            val: null,
            flag: true,
            text: null,
        };
    }
}
