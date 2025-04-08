struct NestDefOpt {
    inner: InnerOpt;
}

struct InnerOpt {
    a: Int?;
    b: Int = 5;
}

contract NestedDefaults {
    prop: NestDefOpt;
    init() {
        self.prop = NestDefOpt { inner: InnerOpt { b: 7 } };
    }
}