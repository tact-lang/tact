struct Inner {
    flag: Bool;
    count: Int;
}

struct Middle {
    value: Int;
    optionalInner: Inner?;
}

contract DeepNestedTest {
    middle: Middle;

    init() {
        self.middle = Middle{ value: 10, optionalInner: null };
    }
}