struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
}

contract TestContract {
    opt1: Opts?;
    opt2: Opts?;
    opt3: Opts?;

    init() {
        self.opt1 = null;
        self.opt2 = Opts{ a:1, b:true, c:"X", d:2 };
        self.opt3 = null;
    }

    receive() {
        self.opt1 = Opts{ a:10, b:false, c:"A", d:null };
        self.opt2 = null;
        self.opt3 = Opts{ a:null, b:null, c:null, d:null };
    }
}