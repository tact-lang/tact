struct Nested2 {
    v1: Int;
    v2: String?;
}

struct Nested1 {
    n2: Nested2;
    flag: Bool;
}

struct Container {
    item: Nested1;
    label: String;
    count: Int;
}

contract NestedComplexTest {
    storage: Container;

    init() {
        self.storage = Container {
            item: Nested1 {
                n2: Nested2 { v1: 99, v2: "abc" },
                flag: true
            },
            label: "container",
            count: 42
        };
    }
}