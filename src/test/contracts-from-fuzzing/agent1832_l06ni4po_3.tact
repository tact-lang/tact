struct InnerMost {
    a: Int;
    b: Int?;
    c: String;
}

struct Inner {
    val1: InnerMost;
    val2: String;
    val3: Int;
}

contract NestedStructContract {
    state: Outer;

    init() {
        self.state = Outer{
            first: Inner{
                val1: InnerMost{
                    a: 123,
                    b: null,
                    c: "hey"
                },
                val2: "world",
                val3: 999
            },
            second: true
        };
    }
}

struct Outer {
    first: Inner;
    second: Bool;
}
