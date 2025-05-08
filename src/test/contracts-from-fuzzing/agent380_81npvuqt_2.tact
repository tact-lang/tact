struct Inner {
    value: Int;
    opt: Bool?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract DeepNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{ value: 7, opt: null },
            flag: true
        };
    }
}