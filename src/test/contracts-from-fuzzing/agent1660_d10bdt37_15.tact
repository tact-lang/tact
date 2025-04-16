struct InnerS {
    a: Int;
    b: Bool;
}

struct OuterS {
    x: Int;
    y: InnerS?;
}

contract Test15 {
    nestedOpt: OuterS;
    init() {
        self.nestedOpt = OuterS{ x:10, y: null };
    }
}