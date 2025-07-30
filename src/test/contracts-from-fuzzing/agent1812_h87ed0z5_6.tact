struct ComplexNestedOpt {
    innerOpt: Inner?;
    simpleInt: Int;
}

struct Inner {
    s: SubInner;
}

struct SubInner {
    x: Int;
    y: Bool;
}

contract ComplexNestedContract {
    data: ComplexNestedOpt;

    init() {
        self.data = ComplexNestedOpt{
            innerOpt: null,
            simpleInt: 10
        };
    }
}