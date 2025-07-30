struct OptStruct {
    val1: Int?;
    val2: Bool?;
    info: String?;
}

contract OptionalFieldsTest {
    opt_field: OptStruct;

    init() {
        self.opt_field = OptStruct{
            val1: null,
            val2: true,
            info: null
        };
    }
}