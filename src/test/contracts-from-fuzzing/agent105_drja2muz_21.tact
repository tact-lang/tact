struct InnerMost {
    f0: Int;
    f1: Bool?;
    f2: String?;
}

struct Inner {
    a: InnerMost?;
    b: Int;
}

struct Outer {
    in1: Inner;
    in2: Inner?;
}

contract TestContract {
    deepest: Outer?;

    init() {
        self.deepest = Outer{
            in1: Inner{ a:null , b:1 },
            in2: null
        };
    }

    receive() {}
}