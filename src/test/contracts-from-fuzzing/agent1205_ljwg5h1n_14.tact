struct Outer {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    field1: Int;
    field2: Bool;
}

contract TestContract {
    out: Outer;
    
    init() {
        self.out = Outer{
            inner1: Inner{field1: 5, field2: true},
            inner2: Inner{field1: 10, field2: false}
        };
    }
}