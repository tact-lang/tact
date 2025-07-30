struct Level3 {
    deep: Int;
}

struct Level2 {
    child: Level3;
}

struct Level1 {
    mid: Level2;
}

contract DeeplyNested {
    val: Level1;
    init() {
        self.val = Level1{mid: Level2{child: Level3{deep: 123}}};
    }
}