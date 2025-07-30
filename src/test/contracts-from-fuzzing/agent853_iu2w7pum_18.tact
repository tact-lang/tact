struct Inner {
    a: Int?;
    b: Bool?;
}

struct MiddleOpt {
    inner: Inner?;
    str: String?;
    num: Int?;
}

contract OptionalStress {
    field: MiddleOpt?;

    init() {
        self.field = null;
    }
}