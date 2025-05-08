struct BigNester {
    aa: Int;
    ab: Bool;
    ac: Int;
    ad: Bool;
    ae: Int;
    af: Bool;
    ag: Int;
    ah: Bool;
    ai: Int;
    aj: Bool;
}

contract Test40 {
    nest: BigNester;

    init() {
        self.nest = BigNester{
            aa:1, ab:true, ac:2, ad:false, ae:3, af:true, ag:4, ah:false, ai:5, aj:true
        };
    }
}
