struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    a: Int?;
    b: Bool;
    c: Inner;
}

contract NestedStructsTest {
    s: Outer;
    
    init() {
        self.s = Outer{
            a: null,
            b: true,
            c: Inner{
                x: 1,
                y: null
            }
        };
    }
}