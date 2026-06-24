struct LargeNestedA {
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Int?;
    a5: Bool?;
}

struct LargeNestedB {
    b1: LargeNestedA;
    b2: LargeNestedA;
    b3: LargeNestedA;
}

contract BigNestedTest {
    big: LargeNestedB;

    init() {
        self.big = LargeNestedB {
            b1: LargeNestedA { a1:1, a2:true, a3:"X", a4:null, a5:null },
            b2: LargeNestedA { a1:2, a2:false, a3:"Y", a4:null, a5:null },
            b3: LargeNestedA { a1:3, a2:true, a3:"Z", a4:null, a5:null }
        };
    }
}
