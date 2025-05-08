struct Level3 {
    leaf: Bool?;
}

struct Level2 {
    sub: Level3?;
    value: Int;
}

struct Level1 {
    core: Level2;
}

contract TestContract {
    payload: Level1;

    init() {
        self.payload = Level1{
            core: Level2{
                sub: null,
                value: 123
            }
        };
    }
}