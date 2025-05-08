struct OptionalsNest {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct InnerOpt {
    inside: OptionalsNest?;
}

contract OptInStructs {
    opt: InnerOpt;

    init() {
        self.opt = InnerOpt{
            inside: OptionalsNest{
                a: 5,
                b: true,
                c: null,
                d: null,
            }
        };
    }
}