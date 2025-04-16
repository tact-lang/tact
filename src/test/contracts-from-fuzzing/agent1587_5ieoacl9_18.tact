struct Level3 {
    note: String;
}

struct Level2 {
    deep: Level3;
}

struct Level1 {
    inner: Level2;
}

contract MultiDeepNest {
    storage: Level1;

    init() {
        self.storage = Level1{inner: Level2{deep: Level3{note:"hello"}}};
    }
}