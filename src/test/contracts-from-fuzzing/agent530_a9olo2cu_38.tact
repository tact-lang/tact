struct InnerOpt {
    a: Int? = null;
    b: Bool? = false;
}

struct OuterOptS {
    nested: InnerOpt;
}

contract OptNestDef {
    val: OuterOptS;

    init() {
        self.val = OuterOptS{
            nested: InnerOpt{}
        };
    }
}
