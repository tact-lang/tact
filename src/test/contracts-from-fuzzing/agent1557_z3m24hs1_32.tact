struct NestedOptionalsCombo {
    a: Int?;
    b: String?;
    c: Bool?;
    d: InnerS?;
}

struct InnerS {
    x: Int;
    y: String?;
}

contract OptionalStructNest {
    s: NestedOptionalsCombo;

    init() {
        self.s = NestedOptionalsCombo{
            a:null,b:null,c:null,d:null
        };
    }
}