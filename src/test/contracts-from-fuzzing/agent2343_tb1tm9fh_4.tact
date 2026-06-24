struct LargeNested {
    aa: Int;
    ab: Bool;
    ac: Int?;
    ad: Bool?;
    ae: Int;
    af: Bool;
    ag: Int?;
    ah: Bool?;
}

contract LargeNestedStructTest {
    big: LargeNested;

    init() {
        self.big = LargeNested{
            aa: 1, ab: false, ac: null, ad: null,
            ae: 2, af: true, ag: null, ah: null
        };
    }
}
