struct Level3 { val: Int }
struct Level2 { l3: Level3 }
struct Level1 { l2: Level2 }
struct Root {
    l1: Level1;
    anotherVal: Int;
}

contract Test {
    root: Root;

    init() {
        self.root = Root{
            l1: Level1{ l2: Level2{ l3: Level3{ val: 10 } } },
            anotherVal: 20
        };
    }
}