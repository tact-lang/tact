struct DeepChain {
    level: Int;
    next: Level2;
}

struct Level2 {
    level: Int;
    next: Level3;
}

struct Level3 {
    val: String;
    done: Bool;
}

contract NestedDepth {
    data: DeepChain;

    init() {
        self.data = DeepChain{
            level: 1,
            next: Level2{
                level: 2,
                next: Level3{
                    val: "end",
                    done: true
                }
            }
        };
    }
}