struct LevelA {
    x: Int;
}

struct LevelB {
    x: Int;
    next: LevelA;
}

struct LevelC {
    x: Int;
    next: LevelB;
}

contract TestContract {
    deeply: LevelC;

    init() {
        self.deeply = LevelC{
            x:55,
            next: LevelB{
                x:44,
                next: LevelA{x:33}
            }
        };
    }

    receive() {}
}