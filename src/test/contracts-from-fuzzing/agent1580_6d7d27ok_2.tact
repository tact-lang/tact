struct Level2 {
    x: Int; 
    y: Int?;
}

struct Level1 {
    l2: Level2;
    n: Int;
}

contract NestedStructs {
    point: Level1;

    init() {
        self.point = Level1{
            l2: Level2{
                x: 7,
                y: null
            },
            n: 42
        };
    }
}