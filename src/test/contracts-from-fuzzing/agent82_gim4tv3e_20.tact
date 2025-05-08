contract NestedStructOptionals {
    nest: Outer;

    init() {
        self.nest = Outer{
            a: 1,
            b: Inner{
                x: 2,
                y: null,
            }
        };
    }
}

struct Outer {
    a: Int;
    b: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}
