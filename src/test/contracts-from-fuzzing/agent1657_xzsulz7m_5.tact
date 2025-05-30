struct Deep {
    level: Int;
    next: Nested;
}

struct Nested {
    flag: Bool;
    inner: Leaf;
}

struct Leaf {
    value: Int;
}

contract TestContract {
    state: Deep;
    init() {
        self.state = Deep{
            level: 1,
            next: Nested{
                flag: true,
                inner: Leaf{value: 42}
            }
        };
    }
}