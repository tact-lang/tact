struct BuilderNest {
    b1: Builder;
    b2: Builder?;
}

contract BuilderFields {
    builders: BuilderNest;

    init() {
        self.builders = BuilderNest{
            b1: beginCell(),
            b2: null
        };
    }
}