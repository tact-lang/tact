struct Params {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    inner: Inner?;
}

struct Inner {
    a: Int = 7;
    b: Bool = false;
}

contract DiverseOptionals {
    p: Params;

    init() {
        self.p = Params{
            intOpt: 1,
            boolOpt: null,
            strOpt: "hi",
            inner: Inner{}
        };
    }
}
