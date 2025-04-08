struct OptionalStruct {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract OptionalExample {
    data: OptionalStruct;
    init() {
        self.data = OptionalStruct{
            f1: null,
            f2: null,
            f3: null
        };
    }
}