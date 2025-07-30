struct InnerOpt {
    z: Int?;
}

struct MiddleOpt {
    innerOpt: InnerOpt?;
}

struct OuterOpt {
    middleOpt: MiddleOpt?;
}

contract TestContract {
    nestedOptionals: OuterOpt;

    init() {
        self.nestedOptionals = OuterOpt{ middleOpt: null };
    }
}