struct NestedOptiDef {
    inn: SOpt?;
    val: Int = 5;
}

struct SOpt {
    a: Int?;
}

contract NestOptDef {
    f: NestedOptiDef;
    init() {
        self.f = NestedOptiDef{
            inn: SOpt{a:null}
        };
    }
}