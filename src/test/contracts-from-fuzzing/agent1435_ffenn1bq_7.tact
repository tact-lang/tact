struct Level3 { deepv: Int? }
struct Level2 { inner: Level3? }
struct Level1 { mid: Level2 }

contract DeepNest {
    storage: Level1;

    init() {
        self.storage = Level1{
            mid: Level2{
                inner: null
            }
        };
    }
}