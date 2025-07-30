struct MixedNested {
    n1: Int?;
    n2: Bool?;
    n3: String?;
}

struct Wrap {
    a: Int;
    m: MixedNested;
}

contract ComboNest {
    w: Wrap;

    init() {
        self.w = Wrap{a:7, m:MixedNested{n1:null,n2:null,n3:null}};
    }
}