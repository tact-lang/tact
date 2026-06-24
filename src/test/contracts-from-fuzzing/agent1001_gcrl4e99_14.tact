struct Inner {
    a: Int;
    b: String;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    b: Bool;
    txt: String?;
}

contract NestedNesting {
    state: Outer;
    
    init() {
        self.state = Outer{
            in1: Inner{a:1, b:"a"},
            in2: Inner{a:2, b:"b"},
            b: true,
            txt: null
        };
    }
}