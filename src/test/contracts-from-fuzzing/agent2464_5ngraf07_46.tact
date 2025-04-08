struct SOptOpt {
    nested: InnerOpt?;
}

struct InnerOpt {
    s: String?;
}

contract OptOpc {
    x: SOptOpt;

    init() {
        self.x = SOptOpt{
            nested: InnerOpt{
                s: null
            }
        };
    }
}
