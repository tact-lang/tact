struct WideMix {
    i1: Int; i2: Int; i3: Int?; i4: Int?;
    b1: Bool; b2: Bool?; b3: Bool?;
    s1: String; s2: String?;
}

contract WideMixContract {
    f: WideMix;
    init() {
        self.f = WideMix{
            i1:1, i2:2, i3:null, i4:4,
            b1:true, b2:null, b3:false,
            s1:"a", s2:null
        };
    }
}