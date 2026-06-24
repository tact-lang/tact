struct NestOptionalDefaults {
    a: Int? = null;
    b: Int? = null;
}

contract NestedOptionalDefaults {
    s: NestOptionalDefaults;

    init() {
        self.s = NestOptionalDefaults{
            a: null, b: null
        };
    }
}