struct Inner {
    v: Int;
}

struct Outer {
    in1: Inner;
    in2: Inner;
}

contract NestedStructDefault {
    value: Outer = Outer{
        in1: Inner{v:1},
        in2: Inner{v:2}
    };
}