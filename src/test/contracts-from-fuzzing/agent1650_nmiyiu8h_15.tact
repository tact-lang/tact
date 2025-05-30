struct Inner {
    flag: Bool;
    optVal: Int?;
}

struct Outer {
    innerField: Inner?;
    fixed: Int;
}

contract TestNestedOptionStructs {
    outer: Outer;

    init() {
        self.outer = Outer{
            innerField: null,
            fixed: 1000,
        };
    }
}