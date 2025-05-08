struct OptionalStruct {
    val: Int?;
}

contract DefaultOptionalStruct {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{
            val: null
        };
    }
}
