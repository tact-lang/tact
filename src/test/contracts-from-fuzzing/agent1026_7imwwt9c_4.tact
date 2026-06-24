struct Level2 {
    z: Int;
}

struct Level1 {
    y: Int?;
    inner: Level2;
}

contract TestContract {
    pos: Level1;

    init() {
        self.pos = Level1{
            y: 5,
            inner: Level2{z: 7}
        };
    }
}