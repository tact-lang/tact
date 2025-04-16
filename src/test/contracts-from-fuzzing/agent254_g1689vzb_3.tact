struct OptionalFieldStruct {
    val1: Int;
    opt1: Int?;
    val2: Int;
    opt2: Bool?;
}

contract OptionalFieldsContract {
    data: OptionalFieldStruct;

    init() {
        self.data = OptionalFieldStruct{
            val1: 100,
            opt1: null,
            val2: 200,
            opt2: true
        };
    }
}