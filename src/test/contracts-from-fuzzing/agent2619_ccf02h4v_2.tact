struct Nested {
    val1: Int;
    val2: Int;
}

struct Container {
    first: Nested;
    second: Nested;
}

contract DeeplyNested {
    data: Container;

    init() {
        self.data = Container{
            first: Nested{ val1: 1, val2: 2 },
            second: Nested{ val1: 3, val2: 4 }
        };
    }
}