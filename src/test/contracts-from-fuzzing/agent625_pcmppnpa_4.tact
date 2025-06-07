struct OptStruct {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract OptFields {
    opt: OptStruct;
    init() {
        self.opt = OptStruct{
            val1: null,
            val2: true,
            val3: "hello",
        };
    }
}