struct Inner {
    a: Int;
}

struct Middle {
    inner: Inner;
    b: Int;
}

struct Outer {
    middle: Middle;
    c: Bool;
}

contract DeepNestedTest {
    data: Outer;
    
    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{a: 1},
                b: 2
            },
            c: true
        };
    }
}