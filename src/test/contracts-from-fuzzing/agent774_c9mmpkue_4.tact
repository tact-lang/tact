struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    opt: OptStruct;

    init() {
        self.opt = OptStruct{ a: null, b: null, c: null };
    }
}