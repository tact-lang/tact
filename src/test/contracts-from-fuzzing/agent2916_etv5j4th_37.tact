struct StringNest1 {
    s: String;
}

struct StringNest2 {
    sn1: StringNest1;
}

struct StringNest3 {
    sn2: StringNest2;
}

contract StringDeepTest {
    data: StringNest3;

    init() {
        self.data = StringNest3{
            sn2: StringNest2{
                sn1: StringNest1{
                    s: "deep"
                }
            }
        };
    }
}