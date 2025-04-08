struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptsDefaults {
    v: Opts = Opts{a:null,b:null,c:null};
    init() {
        self.v = Opts{a:null,b:null,c:null};
    }
}