struct DeepNested {
    a: Level1;
}

struct Level1 {
    b: Level2;
}

struct Level2 {
    c: Level3;
}

struct Level3 {
    d: Level4?;
}

struct Level4 {
    val: Int;
}

contract Test {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            a: Level1{
                b: Level2{
                    c: Level3{
                        d: null
                    }
                }
            }
        };
    }
}