struct InnerOpt {
    z: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalInOptionalStruct {
    mys: OuterOpt?;

    init() {
        self.mys = OuterOpt{
            inner: null
        };
    }
}
