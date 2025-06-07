struct Complex {
    num: Int;
    flag: Bool;
    text: String;
    maybeInner: Inner?;
}

struct Inner {
    nestedStr: String;
    yesno: Bool;
    value: Int;
}

contract ComplexOpt {
    field: Complex;

    init() {
        self.field = Complex{
            num: 5,
            flag: false,
            text: "hi",
            maybeInner: Inner{
                nestedStr: "deep",
                yesno: true,
                value: 42,
            },
        };
    }
}