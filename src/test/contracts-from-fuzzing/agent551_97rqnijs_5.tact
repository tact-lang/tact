struct ComplexOpt {
    n1: Int?;
    n2: Int?;
    flag1: Bool?;
    flag2: Bool?;
    txt: String?;
}

contract TestContract {
    st: ComplexOpt;
    
    init() {
        self.st = ComplexOpt{
            n1: null,
            n2: 42,
            flag1: true,
            flag2: null,
            txt: "optional",
        };
    }
}