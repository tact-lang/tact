struct NestOptDefaults {
    nested: InnerNestOpt?;
}

struct InnerNestOpt {
    x: Int = 123;
    s: String = "def";
}

contract TestNestOptDefaults {
    d: NestOptDefaults;
    init() {
        self.d = NestOptDefaults{
            nested: InnerNestOpt{}
        };
    }
}
