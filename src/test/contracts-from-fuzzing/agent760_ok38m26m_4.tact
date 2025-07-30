struct OptStruct {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract OptionalFieldsTest {
    s: OptStruct;
    init() {
        self.s = OptStruct{ f1: null, f2: true, f3: null };
    }
}
