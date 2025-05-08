struct ContainsOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapperOpt {
    inner: ContainsOptionals;
}

contract OptionalStructsAgain {
    w: WrapperOpt;

    init() {
        self.w = WrapperOpt{
            inner: ContainsOptionals{
                a: null,
                b: null,
                c: null,
            }
        };
    }
}