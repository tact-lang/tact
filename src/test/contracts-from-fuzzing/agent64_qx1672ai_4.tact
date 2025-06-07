struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    flag: Bool;
}

contract Test4 {
    outer1: Outer;
    outer2: Outer;
    init() {
        self.outer1 = Outer{
            inner1: Inner{foo:1,bar:true},
            inner2: Inner{foo:2,bar:false},
            flag: true
        };
        self.outer2 = Outer{
            inner1: Inner{foo:3,bar:false},
            inner2: Inner{foo:4,bar:true},
            flag: false
        };
    }
}