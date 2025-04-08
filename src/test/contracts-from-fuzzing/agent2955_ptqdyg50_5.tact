struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    obj: OptStruct;

    init() {
        self.obj = OptStruct{ a: null, b: true, c: null };
    }
}
