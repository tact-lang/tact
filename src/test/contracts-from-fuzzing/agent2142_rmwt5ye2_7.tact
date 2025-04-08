struct OptionalStruct {
    val: Int?;
    txt: String?;
}

contract ContractWithOptionalStruct {
    data: OptionalStruct?;

    init() {
        self.data = OptionalStruct{
            val: null,
            txt: null,
        };
    }
}
