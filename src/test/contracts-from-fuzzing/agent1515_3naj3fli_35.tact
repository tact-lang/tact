struct DeepWithOptionals {
    a: Int?;
    inner: InnerS?;
}

struct InnerS {
    x: Int?;
    y: Bool;
}

contract DeepOptionalStructs {
    s: DeepWithOptionals;

    init() {
        self.s = DeepWithOptionals{
            a: null,
            inner: null,
        };
    }
}