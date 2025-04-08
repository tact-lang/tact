struct InnerMost {
    flag: Bool;
}

struct Inner {
    x: Int;
    opt: InnerMost?;
}

struct Outer {
    nested: Inner;
    maybe: Bool?;
}

contract NestedStructsTest {
    data: Outer;
    
    init() {
        self.data = Outer{
            nested: Inner{
                x: 1,
                opt: null,
            },
            maybe: true,
        };
    }
}