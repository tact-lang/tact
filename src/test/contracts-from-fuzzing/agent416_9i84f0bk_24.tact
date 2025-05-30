struct NestOptOpt {
    inner: Int?;
}

contract NestedOptionals {
    outer: NestOptOpt?;

    init() {
        self.outer = null;
    }
}