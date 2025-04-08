struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    nested: Inner;
    opt: Int?;
}

contract NestedOptionalTest {
    data: Outer;
    
    init() {
        self.data = Outer{
            nested: Inner{x: 1, y: 2},
            opt: null
        };
    }
}
