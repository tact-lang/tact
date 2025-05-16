struct Inner {
    one: Int?;
    two: Bool?;
    three: String?;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    txt: String;
}

contract TestContract {
    st: Outer;

    init() {
        self.st = Outer{
            inner1: Inner{one:null, two:null, three:null},
            inner2: Inner{one:null, two:null, three:null},
            txt: "abc",
        };
    }
}