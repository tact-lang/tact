struct OptStruct {
    val: Int?;
    flag: Bool?;
}

contract OptFields {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            val: null,
            flag: null,
        };
    }
}