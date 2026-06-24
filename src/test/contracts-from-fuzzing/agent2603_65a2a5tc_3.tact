struct OptStruct {
    f1: Bool?;
    f2: Int?;
    f3: String?;
}

contract OptFieldTest {
    record: OptStruct;

    init() {
        self.record = OptStruct{
            f1: null,
            f2: null,
            f3: null,
        };
    }
}
