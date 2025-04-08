struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract DeepNestedTest {
    val: Outer;

    init() {
        self.val = Outer{
            nested: Inner{a: 1, b: null},
            flag: true
        };
    }
}