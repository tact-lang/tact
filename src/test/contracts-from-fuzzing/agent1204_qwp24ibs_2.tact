struct Small {
    x: Int;
    y: Int;
}

struct Nested {
    s: Small;
    optionalFlag: Bool?;
}

contract NestedStructStorage {
    item: Nested;

    init() {
        self.item = Nested{
            s: Small{ x: 5, y: 10 },
            optionalFlag: true
        };
    }
}