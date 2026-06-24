struct Nested { n1: Int; n2: Bool?; n3: String; }

struct Container { c1: Int; nested: Nested; c2: Int?; }

contract DeepNestedTest {
    storage: Container;

    init() {
        self.storage = Container{
            c1: 123,
            nested: Nested{
                n1: 7,
                n2: null,
                n3: "text",
            },
            c2: null
        };
    }
}