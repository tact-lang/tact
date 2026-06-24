// Contract with nested struct containing an optional struct with nested optional primitive
struct InnerOpt {
    val: Int?;
}

struct Outer {
    inner: InnerOpt?;
    num: Int;
}

contract OptionalNestedStructTest {
    state: Outer = Outer{
        inner: null,
        num: 10,
    };

    init() {
        self.state = Outer{
            inner: InnerOpt{
                val: 100,
            },
            num: 42,
        };
    }

    receive() {
        self.state = self.state;
    }
}