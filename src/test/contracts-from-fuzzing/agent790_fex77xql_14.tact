struct AOP {
    a: Int?;
}

struct BOP {
    b: AOP?;
}

struct COP {
    c: BOP?;
}

contract DeepOptionals {
    nest: COP;

    init() {
        self.nest = COP{c: null};
    }
}