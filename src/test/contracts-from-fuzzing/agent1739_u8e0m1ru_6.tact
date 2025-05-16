struct Inner {
    a: Int;
}

struct Outer {
    b: Inner;
}

contract OptionalNested {
    maybeOuter: Outer?;

    init() {
        self.maybeOuter = Outer{
            b: Inner{ a: 100 }
        };
    }
}