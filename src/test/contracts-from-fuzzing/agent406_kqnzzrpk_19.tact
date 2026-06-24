struct OuterOpt {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: Bool?;
}

contract TestContract {
    o: OuterOpt;
    init() {
        self.o = OuterOpt{ innerOpt: InnerOpt{ x: 13, y: null } };
    }
}