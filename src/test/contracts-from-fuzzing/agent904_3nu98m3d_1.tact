struct Nested {
    inner1: Int;
    inner2: Int;
}

struct Wrapper {
    nested: Nested;
    flag: Bool;
}

contract DeepTest {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            nested: Nested{ inner1: 10, inner2: 20 },
            flag: true,
        };
    }
}