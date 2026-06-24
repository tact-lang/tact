struct Pair {
    x: Int;
    y: Int;
}

struct Container {
    nested: Pair;
    flag: Bool;
}

contract NestedStructFields {
    data: Container;

    init() {
        self.data = Container{
            nested: Pair{ x: 1, y: 2 },
            flag: true,
        };
    }
}