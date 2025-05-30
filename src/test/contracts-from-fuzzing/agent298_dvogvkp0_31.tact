struct ManyBoolOpt {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
}

contract ManyBoolsOpt {
    optdata: ManyBoolOpt;
    init() {
        self.optdata = ManyBoolOpt{ a:null, b:null, c:null, d:null };
    }
}