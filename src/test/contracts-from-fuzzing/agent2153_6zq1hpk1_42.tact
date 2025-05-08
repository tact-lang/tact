struct NestedLots {
    inn: InnerOne;
}

struct InnerOne {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract ManyInnerOptionals {
    hold: NestedLots;

    init() {
        self.hold = NestedLots{ inn: InnerOne{ a:null, b:null, s:null } };
    }
}
