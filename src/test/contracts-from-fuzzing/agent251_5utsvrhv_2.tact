struct Nested {
    inner1: Int;
    inner2: Bool?;
}

struct Wrapper {
    nested: Nested;
    extra: Int?;
}

contract DeepTest {
    state: Wrapper;
    init() {
        self.state = Wrapper{
            nested: Nested{ inner1: 42, inner2: null },
            extra: 5
        };
    }
    receive() {
        self.state = Wrapper{
            nested: Nested{ inner1: 7, inner2: true },
            extra: null
        };
    }
}