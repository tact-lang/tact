struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    flag: Bool;
}

contract MultiInnerStructs {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{a:1,b:true},
            inner2: Inner{a:2,b:false},
            flag: true
        };
    }
}