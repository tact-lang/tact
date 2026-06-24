struct Opts {
    f1: Int?;
    f2: Int?;
    f3: Bool?;
    f4: Address?;
}

contract ManyOpts {
    st: Opts;

    init() {
        self.st = Opts{
            f1:null, f2:null, f3:null, f4:null
        };
    }
}