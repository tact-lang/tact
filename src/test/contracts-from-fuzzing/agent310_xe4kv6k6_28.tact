struct Outer {
    x: Int;
    optInner: Inner?;
}

struct Inner {
    y: Int;
}

contract ForwardReferenceOptional {
    field: Outer;

    init() {
        self.field = Outer{
            x: 1,
            optInner: null
        };
    }
}