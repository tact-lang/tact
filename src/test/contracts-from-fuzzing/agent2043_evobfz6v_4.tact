struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    data: OptStruct;

    init() {
        self.data = OptStruct{a: null, b: null, c: null};
    }
}
