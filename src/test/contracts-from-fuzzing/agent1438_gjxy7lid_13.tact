struct InnerOpt {
    x: Int? = 42;
}

struct Middle {
    inn: InnerOpt? = null;
    flag: Bool = false;
}

contract OptionalChain {
    m: Middle? = null;

    init() {
        self.m = null;
    }
}