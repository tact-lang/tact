struct HasBoolIntOpt {
    a: Bool;
    b: Int?;
}

contract FlatComposite {
    f1: HasBoolIntOpt;
    f2: HasBoolIntOpt;

    init() {
        self.f1 = HasBoolIntOpt{a:true,b:null};
        self.f2 = HasBoolIntOpt{a:false,b:null};
    }
}
