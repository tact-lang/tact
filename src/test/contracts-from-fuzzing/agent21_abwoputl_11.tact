struct InnerOpt {
    score: Int?;
    label: String?;
}

struct ComplexOpt {
    enabled: Bool?;
    token: InnerOpt?;
}

contract OptCombo {
    data: ComplexOpt;

    init() {
        self.data = ComplexOpt{
            enabled: null,
            token: InnerOpt{ score: 42, label: null }
        };
    }
}
