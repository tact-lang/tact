struct OptStruct {
    info: String?;
    number: Int?;
    flag: Bool?;
}

contract OptVarTest {
    s: OptStruct;

    init() {
        self.s = OptStruct{
            info: null,
            number: null,
            flag: null
        };
    }
}