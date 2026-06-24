struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    f1: Inner;
    f2: Inner;
    optInner: Inner?;
}

contract MultipleSameStruct {
    data: Outer;

    init() {
        self.data = Outer{
            f1: Inner{a:1,b:true},
            f2: Inner{a:2,b:false},
            optInner: Inner{a:3,b:true}
        };
    }
}