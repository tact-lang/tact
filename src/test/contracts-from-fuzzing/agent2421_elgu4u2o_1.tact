struct Nested {
    n: Int?;
    str: String;
}

struct Container {
    inner: Nested;
    flag: Bool;
    num: Int;
}

contract DeepTest {
    state: Container;

    init() {
        self.state = Container{
            inner: Nested{ n: null, str: "hello" },
            flag: true,
            num: 42,
        };
    }
}