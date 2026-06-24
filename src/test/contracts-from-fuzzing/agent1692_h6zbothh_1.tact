struct InnerMost {
    flag: Bool;
    value: Int;
}

struct Inner {
    nested: InnerMost;
    message: String;
}

struct Outer {
    optInner: Inner?;
    count: Int;
}

contract NestedStructsTest {
    data: Outer;
    
    init() {
        self.data = Outer{
            optInner: null,
            count: 0
        };
    }
}