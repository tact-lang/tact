struct ManyFields {
    aa: Int;
    ab: Int;
    ac: Int;
    ad: Int;
    ae: Int;
    af: Int;
    ag: Int;
    ah: Int;
    ai: Int;
    aj: Int;
    ak: Int;
    al: Int;
}

contract Test {
    f: ManyFields = ManyFields{
        aa:1, ab:2, ac:3, ad:4, ae:5, af:6, ag:7, ah:8, ai:9, aj:10, ak:11, al:12
    };
    init() {
        self.f = ManyFields{
            aa:12, ab:11, ac:10, ad:9, ae:8, af:7, ag:6, ah:5, ai:4, aj:3, ak:2, al:1
        };
    }
}