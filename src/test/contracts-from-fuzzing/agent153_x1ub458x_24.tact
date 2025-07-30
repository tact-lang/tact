struct Opts {
    a: Int?;
    b: Bool?;
}

contract OverwriteOptionals {
    f: Opts;

    init() {
        self.f = Opts{a:null,b:null};
        self.f.a = 777;
        self.f.b = true;
    }
}