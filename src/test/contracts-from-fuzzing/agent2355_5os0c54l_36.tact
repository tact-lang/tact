struct ComboNest {
    s1: SNest1;
    s2: SNest2;
}

struct SNest1 {
    f1: Int;
    f2: String;
}

struct SNest2 {
    f3: Bool;
    f4: Int?;
}

contract ComboComplex {
    f: ComboNest;

    init() {
        self.f = ComboNest{
            s1: SNest1{f1:1,f2:"abc"},
            s2: SNest2{f3:true,f4:null}
        };
    }
}