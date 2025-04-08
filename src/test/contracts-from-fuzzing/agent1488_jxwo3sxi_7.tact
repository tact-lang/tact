struct Container {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    a: Int;
    b: Bool;
    c: String;
}

contract MultiLayer {
    state: Container;

    init() {
        self.state = Container{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        a: 1, b: false, c: "deep"
                    }
                }
            }
        };
    }
}