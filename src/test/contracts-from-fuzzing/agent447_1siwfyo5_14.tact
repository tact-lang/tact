struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptFields {
    f1: DeepOpt?;
    f2: DeepOpt?;
    f3: DeepOpt?;
    
    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
    }
}