struct InnerOpt {
    inner: Int?;
}

struct WrapOpt {
    a: InnerOpt?;
}

contract ComboOptional {
    inside: WrapOpt?;

    init() {
        self.inside = WrapOpt{
            a: InnerOpt{ inner: null }
        };
    }
}