struct BigOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
}

struct WrapOpt {
    optBig: BigOpt?;
}

contract TestContract {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{ optBig: null };
    }
}