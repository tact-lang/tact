struct Level3 {
    x: Int?;
}

struct Level2 {
    deeper: Level3?;
}

struct Level1 {
    deep: Level2?;
}

contract MultiOptNest {
    persist: Level1;

    init() {
        self.persist = Level1{
            deep: Level2{
                deeper: null
            }
        };
    }
}