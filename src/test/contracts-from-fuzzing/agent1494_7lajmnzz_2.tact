struct Nested {
    foo: Int;
    bar: Int?;
}

struct Container {
    nested: Nested;
    flag: Bool;
}

contract DeepTest {
    data: Container;
    init() {
        self.data = Container{
            nested: Nested{ foo: 7, bar: null },
            flag: true
        };
    }
}