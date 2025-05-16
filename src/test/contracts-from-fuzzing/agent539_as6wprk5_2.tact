struct Nested {
    x: Int;
    y: Bool?;
}

struct Wrapper {
    nested: Nested;
    flag: Bool;
}

contract Complex {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: Nested{ x: 5, y: null },
            flag: true
        };
    }
}