struct Level3 { val: Int }

struct Level2 { nested: Level3 }

struct Level1 { inner: Level2 }

contract DeepThreeLevel {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                nested: Level3{ val: 123 }
            }
        };
    }
}