struct OptionStruct {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract OptionalStorage {
    store: OptionStruct;

    init() {
        self.store = OptionStruct{
            f1: null,
            f2: null,
            f3: null
        };
    }
}
