struct OptionalStruct {
    val1: Int?;
    val2: String?;
    val3: Bool?;
}

contract OptionalContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            val1: null,
            val2: null,
            val3: null
        };
    }
}