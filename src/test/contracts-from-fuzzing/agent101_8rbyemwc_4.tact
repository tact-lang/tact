struct OptStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract TestContract {
    opt: OptStruct;
    init() {
        self.opt = OptStruct{ a: null, b: true, c: null, d: "hello" };
    }
}