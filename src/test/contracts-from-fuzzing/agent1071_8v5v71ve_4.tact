struct OptStruct {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract Test5 {
    opt: OptStruct = OptStruct{};

    init() {
        self.opt = OptStruct{ a: 123, b: true, s: "abc" };
    }
}