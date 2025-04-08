struct OptStrs {
    a: String?;
    b: String?;
    c: String?;
}

contract OptStringer {
    store: OptStrs;
    init() {
        self.store = OptStrs{ a:"x", b:null, c:"y" };
    }
}