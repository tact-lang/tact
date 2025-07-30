struct ManyOpts {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OnlyOptional {
    v: ManyOpts = ManyOpts{ a:null,b:null,s:null };

    init() {
        self.v = self.v;
    }

    receive() {
        self.v = self.v;
    }
}