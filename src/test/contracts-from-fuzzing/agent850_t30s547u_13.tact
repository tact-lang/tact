struct Innermost {
    x: Int;
}

struct InnerOpt {
    inner: Innermost?;
}

contract OptionalDeep {
    field: InnerOpt?;

    init() {
        self.field = null;
    }
}