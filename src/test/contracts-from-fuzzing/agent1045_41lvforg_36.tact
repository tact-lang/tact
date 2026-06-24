struct Level3 {
    val: Int;
}

struct Level2 {
    deep: Level3?;
}

struct Level1 {
    mid: Level2?;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            mid: Level2{
                deep: null
            }
        };
    }
}