struct OptStruct {
    val: Int?;
    label: String?;
}

contract OptionalFieldsTest {
    st: OptStruct;

    init() {
        self.st = OptStruct{
            val: null,
            label: null
        };
    }
}
