struct MixNestedOptDef {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: Int = 1;
}

contract OptDefCombo {
    field: MixNestedOptDef;

    init() {
        self.field = MixNestedOptDef{ a:null, c:"yo" };
    }
}