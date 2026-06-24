struct InnerOptField {
    a: Int?;
}

struct MiddleOpt {
    inner: InnerOptField?;
}

contract DeepOptionals {
    field: MiddleOpt?;

    init() {
        self.field = null;
    }
}