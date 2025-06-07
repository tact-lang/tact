struct Outermost {
    inner: LevelA;
}

struct LevelA {
    a: Int;
    next: LevelB;
}

struct LevelB {
    b: Bool;
    next: LevelC;
}

struct LevelC {
    c: String;
}

contract DeepChain {
    storage: Outermost;

    init() {
        self.storage = Outermost{
            inner: LevelA{
                a: 1,
                next: LevelB{
                    b: true,
                    next: LevelC{ c: "end" }
                }
            }
        };
    }
}