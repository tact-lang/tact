struct OptionStruct {
    inner1: Int?;
    inner2: Bool?;
    inner3: String?;
}

contract OptStructStorage {
    s: OptionStruct;

    init() {
        self.s = OptionStruct{
            inner1: null,
            inner2: null,
            inner3: null,
        };
    }
}