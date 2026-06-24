struct OptStruct {
    f1: Int?;
    f2: String?;
    f3: Bool?;
    f4: Address?;
}

contract NullOptStruct {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
        };
    }
}