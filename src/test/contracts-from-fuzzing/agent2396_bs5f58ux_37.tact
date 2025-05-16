struct WrapOpt {
    inner: Int?;
}

struct OuterOpt {
    wrap: WrapOpt?;
}

contract ChainOptional {
    f: OuterOpt;

    init() {
        self.f = OuterOpt{ wrap: null };
    }
}
