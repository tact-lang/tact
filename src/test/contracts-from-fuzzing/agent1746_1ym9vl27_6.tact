struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    in1: Inner;
    in2: Bool?;
    num: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            in1: Inner{a:7,b:null},
            in2: null,
            num: 99
        };
    }
}