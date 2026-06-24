struct OptStruct {
    val: Int?;
    flag: Bool?;
}

contract OptStructStorage {
    s: OptStruct;

    init() {
        self.s = OptStruct{
            val: null,
            flag: true,
        };
    }
}