struct WithOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalDeep {
    fld: WithOpt;

    init() {
        self.fld = WithOpt{ a:null, b:true, c:null };
    }
}