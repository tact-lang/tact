struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    a: InnerOpt?;
    b: InnerOpt?;
}

contract Test {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            a: InnerOpt{ x:null, y:null },
            b: null
        };
    }
}