struct Inner {
    a: Int;
    b: String;
    c: Bool;
}

struct Outer {
    in1: Inner;
    in2: Inner;
}

contract Test {
    nested: Outer;

    init() {
        self.nested = Outer{
            in1: Inner{a:1, b:"a", c:true},
            in2: Inner{a:2, b:"b", c:false}
        };
    }
}