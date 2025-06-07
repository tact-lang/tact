struct OuterOpt {
    s: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract OptCombo {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            s: null
        };
    }
}