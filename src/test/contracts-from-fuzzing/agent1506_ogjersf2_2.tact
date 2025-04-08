struct Level1 {
    a: Int?;
    b: Level2?;
}

struct Level2 {
    x: Int?;
    y: Bool;
}

contract TestContract {
    state: Level1;

    init() {
        self.state = Level1{
            a: null,
            b: Level2{
                x: null,
                y: true,
            },
        };
    }
}