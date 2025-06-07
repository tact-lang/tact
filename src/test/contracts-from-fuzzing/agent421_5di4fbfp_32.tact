struct BoolOpt {
    b1: Bool?;
    b2: Bool?;
}

contract BoolOptPersist {
    f: BoolOpt;

    init() {
        self.f = BoolOpt{ b1:true, b2:null };
    }
}