struct Inner {
    num: Int;
    flag: Bool;
}

struct Middle {
    innerField: Inner;
    optionalInner: Inner?;
}

contract DeepNestedTest {
    data: Middle;

    init() {
        self.data = Middle{
            innerField: Inner{num: 1, flag: true},
            optionalInner: null,
        };
    }
}