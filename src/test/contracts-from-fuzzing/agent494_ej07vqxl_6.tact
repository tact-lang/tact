struct Level1 {
    x: Int;
    next: Level2;
}

struct Level2 {
    y: Bool;
    next: Level3;
}

struct Level3 {
    z: String?;
}

contract PartiallyOptional {
    val: Level1;

    init() {
        self.val = Level1{
            x: 5,
            next: Level2{
                y: false,
                next: Level3{
                    z: null,
                },
            },
        };
    }
}