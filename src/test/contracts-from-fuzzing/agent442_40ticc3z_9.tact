struct LargeNested {
    a: Int;
    b: SubOne;
    c: SubTwo;
    d: SubThree;
}

struct SubOne {
    x1: Int;
    x2: Bool;
    x3: String;
}

struct SubTwo {
    y1: Address;
    y2: String?;
}

struct SubThree {
    z1: Int?;
    z2: Bool?;
}

contract BigNestedTest {
    val: LargeNested;

    init() {
        self.val = LargeNested{
            a: 5,
            b: SubOne{ x1:1, x2:true, x3:"x" },
            c: SubTwo{ y1:myAddress(), y2:null },
            d: SubThree{ z1:null, z2:false }
        };
    }
}
