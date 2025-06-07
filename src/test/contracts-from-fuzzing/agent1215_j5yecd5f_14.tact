struct Inner {
    x: Int;
}
struct Outer {
    y: Inner;
}

contract AssignOuter {
    innerField: Inner;
    outerField: Outer;

    init() {
        self.innerField = Inner{x: 5};
        self.outerField = Outer{y: self.innerField};
    }
}