struct Level3 {
    val: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    nested: Level2;
}

contract Test {
    deep: Level1;

    init() {
        self.deep = Level1{nested: Level2{inner: Level3{val: 123}}};
    }
}