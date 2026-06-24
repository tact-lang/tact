struct SimpleWithOpt {
    a: Int;
    b: Int?;
}

contract SimpleWithOptContract {
    f: SimpleWithOpt;

    init() {
        self.f = SimpleWithOpt{a:1,b:null};
    }
}