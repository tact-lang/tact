struct TripleNest {
    s1: InnerOne;
    s2: InnerTwo;
}

struct InnerOne {
    x: Int;
    y: Bool?;
}

struct InnerTwo {
    s3: InnerThree;
    t: String?;
}

struct InnerThree {
    z: Bool;
}

contract TripleNestedStruct {
    data: TripleNest;

    init() {
        self.data = TripleNest{
            s1: InnerOne{ x:1, y:null },
            s2: InnerTwo{
                s3: InnerThree{ z:true },
                t:null
            }
        };
    }
}
