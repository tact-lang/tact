struct WithOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract F {
    f: WithOptional;

    init() {
        self.f = WithOptional{a:null, b:null, c:null, d:null};
    }
}