struct Inner {
    foo: Int;
    bar: Bool?;
}

struct Outer {
    baz: Int;
    nested: Inner;
    opt_nested: Inner?;
}

contract NestedTest {
    val: Outer;
    
    init() {
        self.val = Outer{
            baz: 1,
            nested: Inner{ foo: 2, bar: true },
            opt_nested: null
        };
    }
}