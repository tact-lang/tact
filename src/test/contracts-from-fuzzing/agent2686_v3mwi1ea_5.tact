struct InnerOpt {
    x: Int?;
    y: Bool;
}

struct ComplexOpt {
    inner: InnerOpt?;
    message: String;
}

contract OptStructInOpt {
    data: ComplexOpt;

    init() {
        self.data = ComplexOpt{
            inner: null,
            message: "Hi"
        };
    }
}
