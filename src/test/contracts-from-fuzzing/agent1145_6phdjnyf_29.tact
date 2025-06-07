struct OptionalsEdge {
    oi1: Int?;
    oi2: Int?;
    os1: String?;
    os2: String?;
    ob1: Bool?;
    ob2: Bool?;
}

contract OptionalsEdgeTest {
    s: OptionalsEdge;

    init() {
        self.s = OptionalsEdge{
            oi1:null, oi2:2,
            os1:"", os2:null,
            ob1:true, ob2:null
        };
    }
}
