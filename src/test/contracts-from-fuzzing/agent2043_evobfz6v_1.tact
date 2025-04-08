struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    optInner: Inner?;
    flag: Bool;
}

contract NestingFields {
    rec: Outer;

    init() {
        self.rec = Outer{
            in1: Inner{a:1,b:true},
            in2: Inner{a:2,b:false},
            optInner: null,
            flag: true
        };
    }
}
