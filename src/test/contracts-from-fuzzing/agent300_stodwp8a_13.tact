struct OptionStruct {
    optA: Int?;
    optB: Int?;
    optC: Bool?;
    optD: Bool?;
    optE: String?;
    optF: String?;
}

contract TestContract {
    data: OptionStruct;

    init() {
        self.data = OptionStruct{
            optA: 1,
            optB: null,
            optC: true,
            optD: null,
            optE: "hi",
            optF: null,
        };
    }
}