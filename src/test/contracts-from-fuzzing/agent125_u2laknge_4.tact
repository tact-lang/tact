struct OptStruct {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    str: String?;
}

contract OptionalsTest {
    optionalData: OptStruct;

    init() {
        self.optionalData = OptStruct{
            o1: null,
            o2: 100,
            o3: true,
            str: null,
        };
    }
}