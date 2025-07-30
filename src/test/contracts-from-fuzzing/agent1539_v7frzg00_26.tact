struct NestOptDefault {
    a: Int? = null;
    b: InnerOpt? = null;
}

struct InnerOpt {
    x: Int? = null;
}

contract HasNestedDefaults {
    nest: NestOptDefault;
    init() {
        self.nest = NestOptDefault{};
    }
}