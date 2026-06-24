struct InnerOpt {
 innerVal: Int?;
}

struct MiddleOpt {
 nested: InnerOpt?;
}

contract ComplexOptNest {
    data: MiddleOpt;

    init() {
        self.data = MiddleOpt{nested: InnerOpt{innerVal: 123}};
    }
}