struct DeepInner {
    flag: Bool;
    message: String;
}

struct Mid {
    num: Int;
    inner: DeepInner;
}

struct Top {
    label: String;
    mid: Mid;
    status: Bool?;
}

contract DeepNestedTest {
    state: Top;

    init() {
        self.state = Top{
            label: "L",
            mid: Mid{
                num: 7,
                inner: DeepInner{
                    flag: true,
                    message: "hello"
                }
            },
            status: null
        };
    }
}