struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFieldsTest {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            a: null,
            b: null,
            c: null
        };
    }
}