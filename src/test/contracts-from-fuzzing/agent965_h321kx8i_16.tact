struct Level2 {
    x: Int;
    y: Bool;
}

struct Level1 {
    a: Int;
    nested: Level2;
}

contract NestedOrder {
    data: Level1;

    init() {
        self.data = Level1{
            a: 5,
            nested: Level2{
                x: 6,
                y: true,
            },
        };
    }
}