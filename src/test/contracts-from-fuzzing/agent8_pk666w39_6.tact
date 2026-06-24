struct Inner {
    a: Int;
    b: Int;
    c: Int;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    in3: Inner;
}

contract LargeNested {
    s: Outer;

    init() {
        self.s = Outer{
            in1: Inner{a:1,b:2,c:3},
            in2: Inner{a:4,b:5,c:6},
            in3: Inner{a:7,b:8,c:9}
        };
    }
}