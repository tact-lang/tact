struct InnerMost {
    val: Int?;
}

struct Inner {
    innermost: InnerMost;
    flag: Bool?;
}

struct Outer {
    inner: Inner;
    nickname: String?;
}

contract DeepNestedStructTest {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{
                innermost: InnerMost{ val: 99 },
                flag: true
            },
            nickname: "deep"
        };
    }
}