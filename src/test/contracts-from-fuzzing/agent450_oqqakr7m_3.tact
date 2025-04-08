struct Level3 {
    foo: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNest {
    val: Level1;
    init() {
        self.val = Level1{l2: Level2{l3: Level3{foo: 123}}};
    }
}