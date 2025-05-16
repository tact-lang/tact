struct DeepNested {
    a: Int;
    b: Bool;
}

struct Level2 {
    n1: DeepNested;
    n2: DeepNested;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            l2a: Level2{
                n1: DeepNested{a: 1, b: true},
                n2: DeepNested{a: 2, b: false},
            },
            l2b: Level2{
                n1: DeepNested{a: 3, b: true},
                n2: DeepNested{a: 4, b: false},
            }
        };
    }
}