struct OptBoolNested {
    flag: Bool;
    maybe: Bool?;
}

struct OuterOpt {
    inner: OptBoolNested?;
}

contract OptBoolContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: OptBoolNested{ flag: true, maybe: null }
        };
    }
}