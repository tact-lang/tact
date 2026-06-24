struct Inner {
    flag: Bool;
    value: Int;
}

struct Middle {
    inner: Inner;
    text: String;
    optionalNumber: Int?;
}

contract DeepNestedTest {
    middleData: Middle;

    init() {
        self.middleData = Middle{
            inner: Inner{
                flag: false,
                value: -42
            },
            text: "hi",
            optionalNumber: null
        };
    }
}