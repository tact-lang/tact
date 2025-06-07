struct OptStruct {
    a: Int?;
    b: Bool?;
}

struct Outer {
    s1: OptStruct;
    s2: OptStruct;
    s3: OptStruct;
}

contract TestContract {
    outer: Outer;
    init() {
        self.outer = Outer{
            s1: OptStruct{ a: 1, b: true },
            s2: OptStruct{ a: null, b: null },
            s3: OptStruct{ a: 42, b: null }
        };
    }
    receive() {
        self.outer.s1.b = false;
    }
}