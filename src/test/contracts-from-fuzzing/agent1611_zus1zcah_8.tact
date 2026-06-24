struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Inner;
    optionalInner: Inner?;
}

contract InnerStructTest {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{a:1,b:true},
            optionalInner: null
        };
    }
}