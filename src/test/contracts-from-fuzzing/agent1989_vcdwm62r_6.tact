struct InnerMost {
    value: Int?;
    flag: Bool;
}

struct Middle {
    inner: InnerMost;
    text: String;
}

struct Top {
    middle: Middle;
}

contract StringNestedTest {
    data: Top;

    init() {
        self.data = Top{
            middle: Middle{
                inner: InnerMost{
                    value: null,
                    flag: true,
                },
                text: "Hello",
            },
        };
    }
}