struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptContract {
    s: OptStruct;

    init() {
        self.s = OptStruct{ a:null, b:null, c:null, d:null };
    }
}