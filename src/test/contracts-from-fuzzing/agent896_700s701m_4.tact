struct Level3 {
    z: Bool?;
}

struct Level2 {
    y: Int;
    next: Level3;
}

struct Level1 {
    x: Address;
    next: Level2;
}

contract Test {
    data: Level1;
    init() {
        self.data = Level1{
            x: myAddress(),
            next: Level2{
                y: 123,
                next: Level3{
                    z: false
                }
            }
        };
    }
}