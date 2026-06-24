struct Inner {
    foo: Int;
}

struct Outer {
    bar: Int;
    nested: Inner;
    baz: Int;
}

contract OrderTest {
    val: Outer;
    
    init() {
        self.val = Outer{
            bar: 1,
            nested: Inner{foo:2},
            baz: 3
        };
    }
}