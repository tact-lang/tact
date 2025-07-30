struct OptStr {
    s: String?;
}

struct Inner {
    ostr: OptStr;
}

struct Outer {
    inr: Inner;
}

contract OptStringDeep {
    storage: Outer;

    init() {
        self.storage = Outer{
            inr: Inner{
                ostr: OptStr{ s: null }
            }
        };
    }
}