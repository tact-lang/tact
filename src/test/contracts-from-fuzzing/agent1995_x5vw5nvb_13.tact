struct OptionalStruct {
    val: Int?;
    text: String?;
    flag: Bool?;
}

contract OptionalVars {
    s: OptionalStruct;
    init() {
        self.s = OptionalStruct{
            val: null,
            text: null,
            flag: null
        };
    }
}