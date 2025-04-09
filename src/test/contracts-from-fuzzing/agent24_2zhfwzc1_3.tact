struct OptionalStruct {
    val: Int?;
    flag: Bool?;
    note: String?;
}

contract OptionalFieldsTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            val: null,
            flag: true,
            note: "Hello",
        };
    }
}