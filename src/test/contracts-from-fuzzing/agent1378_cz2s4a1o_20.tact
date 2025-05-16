struct SOpt {
    s: String?;
    n: Int?;
    b: Bool?;
}
contract ManyOpts {
    opt: SOpt = SOpt{s:null, n:null, b:null};
    init() {
        self.opt = SOpt{s:"test", n:1, b:true};
    }
    receive() {}
}