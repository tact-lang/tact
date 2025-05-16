struct NestedMany {
    s1: String;
    s2: String?;
    b1: Bool;
    i1: Int?;
    b2: Bool?;
}

contract BigOpt {
    f: NestedMany;

    init() {
        self.f = NestedMany{
            s1:"hi", s2:null, b1:true, i1:42, b2:null
        };
    }
}