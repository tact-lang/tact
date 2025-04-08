struct Outer {
    in1: Int;
    in2: Inner;
}

struct Inner {
    deep: Int;
}

contract NestedOrder {
    one: Outer;
    two: Inner;
    init() {
        self.one = Outer{in1:1,in2:Inner{deep:2}};
        self.two = Inner{deep:3};
    }
}