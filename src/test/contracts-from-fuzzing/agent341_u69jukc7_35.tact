struct OptionNested {
    nestedOpt: InnerOpt?;
}

struct InnerOpt {
    p: Int?;
    q: String?;
}

contract TestContract {
    x: OptionNested;

    init() {
        self.x = OptionNested{
            nestedOpt: InnerOpt{
                p: null,
                q: null
            }
        };
    }
}