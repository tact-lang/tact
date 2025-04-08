struct InnerS {
    p: Int = 77;
    q: String?;
}

struct TopS {
    x: Int?;
    y: Bool?;
    z: String?;
    nested: InnerS?;
}

contract OptNestedMix {
    mydata: TopS;

    init() {
        self.mydata = TopS{
            x: null,
            y: null,
            z: null,
            nested: null
        };
    }

    receive() {
        if (self.mydata.nested != null && self.mydata.nested!!.q != null) {
            dump(self.mydata.nested!!.q!!);
        }
    }
}