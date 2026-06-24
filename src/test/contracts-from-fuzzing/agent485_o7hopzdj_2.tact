struct Nested {
    inner1: Int;
    inner2: Bool;
}

struct Outer {
    nested: Nested;
    flag: Bool;
}

contract StorageTest {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Nested{ inner1: 5, inner2: false },
            flag: true
        };
    }
}