struct Inner {
    val: Int;
}

struct Outer {
    optInner: Inner?;
}

struct Container {
    outer: Outer;
    maybeOuter: Outer?;
}

contract MixedOptionals {
    data: Container;

    init() {
        self.data = Container{
            outer: Outer{ optInner: null },
            maybeOuter: null
        };
    }
}