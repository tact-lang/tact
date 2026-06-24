struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapOpt {
    s: SOpt?;
}

contract OptionalStructWrap {
    param: WrapOpt;

    init() {
        self.param = WrapOpt{
            s: SOpt{
                a: null,
                b: false,
                c: "string"
            }
        };
    }
}