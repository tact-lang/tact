struct Inner {
    one: Int;
    two: Bool;
}

struct Outer {
    a: Int;
    inner1: Inner;
    inner2: Inner;
    b: Bool;
}

contract NestTest {
    field: Outer;
    init() {
        self.field = Outer{
            a:10,
            inner1: Inner{one:1, two:true},
            inner2: Inner{one:2, two:false},
            b:true,
        };
    }
}
