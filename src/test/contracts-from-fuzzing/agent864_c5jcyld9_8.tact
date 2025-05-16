struct Level2 {
    k: Int;
    flag: Bool;
}

struct Level1 {
    sub: Level2?;
}

contract TestContract {
    top: Level1;

    init() {
        self.top = Level1{
            sub: Level2{
                k: 5,
                flag: true
            }
        };
    }
}